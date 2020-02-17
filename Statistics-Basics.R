# MEAN, MEDIAN & MODE
x = c(1,2,2,3,3,4,7,18,20,7,7)
# Finding mean for the vector
mean_x = mean(x)
print(mean_x)

#trim = 0.2 -> arranges elements in vector in ascending order
  #removes 20% of elements from the start and the end of the vector
trim_mean_x = mean(x, trim = 0.2)
print(trim_mean_x)

# Finding median of the vector
median_x = median(x)
print(median_x)

# Defining function to find mode in the vector
  # unique(x) returns vector with unique elements in x
  # match(x,y) returns vector with corresponding position of elements in y that elements x match with
  # tabulate(x) returns number of eccourences of each element in x
  # which.max(x) returns maximum element from the vector
getmode = function(inp_vec)
{
  unique_inp_vec = unique(inp_vec)
  unique_inp_vec[which.max(tabulate(match(inp_vec, unique_inp_vec)))]
}

mode_x = getmode(x)
print(mode_x)

##############################################################################################

# PROBABILITY DENSITY FUNCTION(PDF)

# NORMAL DISTRIBUTION - CONTINUOS
  # Creating a sequence
x = seq(-10, 10, by = 0.1)
print(x)

# Creating PDF - Normal distribution for the sequence
y = dnorm(x, mean = 0, sd = 1)
print(y)

# Visualizing the normal distribution
plot(x, y)




# BINOMIAL DISTRIBUTION - DISCRETE
  # Off 20 trials, what is the prob of 10 success trials ? (prob of success in a trial = 0.5)
y = dbinom(x = 10, size = 20, prob = 0.5)
print(y)

##############################################################################################

# CUMULATIVE DITRIBUTION FUNCTION(CDF) - Integrating over densities of PDF (P(X<=x))
  
# NORMAL DISTRIBUTION - CONTINUOS
  # Creating a sequence
x = seq(-10, 10, by = 0.1)
print(x)

# Creating cumulative distribution for the sequence - left/lower half
y = pnorm(x, mean = 0, sd = 1, lower.tail = TRUE)
print(y)

# Visualizing the cumulative distribution
plot(x, y)

# Creating cumulative distribution for the sequence - right/upper half
y = pnorm(x, mean = 0, sd = 1, lower.tail = FALSE)
print(y)

# Visualizing the cumulative distribution
plot(x, y)




# BINOMIAL DISTRIBUTION - DISCRETE
  # Off 20 trials, what is the prob of MORE THAN 10 success trials ? (prob of success in a trial = 0.5)
y = pbinom(q = 10, size = 20, prob = 0.5, lower.tail = FALSE)
print(y)

  # Off 20 trials, what is the prob of LESS THAN 10 success trials ? (prob of success in a trial = 0.5)
y = pbinom(q = 10, size = 20, prob = 0.5, lower.tail = TRUE)
print(y)

##############################################################################################

# QUANTILE FUNCTION - Inverse of CDF
  # Given with probability value, returns the value

# NORMAL DISTRIBUTION - CONTINUOS
  # Creating a sequence
x = seq(0, 1, by = 0.02)
print(x)

# Creating Quantile function for the sequence
y = qnorm(x, mean = 0, sd = 1)
print(y)

# Visualizing the quantile function
plot(x, y)




# BINOMIAL DISTRIBUTION - DISCRETE
  # 10 observations whose each total outcomes is 20 and probability of success outcome is 0.5
y = rbinom(n = 10, size = 20, prob = 0.5)
print(y)
##############################################################################################

# ANALYSIS OF VARIANCE - used to identify significance of each feature(pair of features)on target
  # check the "p-value -> Pr(>F)"
  # attribute with p-value < 0.05 is said to be significant
  
  # If p-value of a*b is the significant, means that effect of 'a/b' depends on 'b/a'
  # If p-value of a+b is the significant, means that effect of 'a/b' independent of 'b/a'

aov_sample = aov(formula = mpg~cyl*disp, data = mtcars)
print(summary(aov_sample))

aov_sample2 = aov(formula = mpg~cyl+disp, data = mtcars)
print(summary(aov_sample2))

# ANOVA - used to compare variance of two models
anova_sample = anova(aov_sample, aov_sample2)
print(anova_sample)

##############################################################################################

# Time series
rainfall_1 = c(799, 1174.8, 865.1, 1334.2, 635.7, 918.5, 898.6, 1071)
rainfall_2 = c(699, 1094.8, 895.1, 1734.2, 785.7, 912.5, 812.6, 771)
  # Grouping by month - 1 month
rainfall_1_monthly = ts(rainfall1, start = c(2016, 1), frequency = 12)
print(rainfall_1_monthly)
plot(rainfall_1_monthly)

  # Grouping by a quarter - 4 months
rainfall_1_quarter= ts(rainfall1, start = c(2016, 1), frequency = 4)
print(rainfall_1_quarter)
plot(rainfall_1_quarter)

# Combining timeseries 1 & timeseies 2 as successive years
rainfall_combined = matrix(c(rainfall_1, rainfall_2))
print(rainfall_combined)
rainfall_combined_monthly = ts(rainfall_combined, start = c(2016, 1), frequency = 12)
plot(rainfall_combined_monthly)

##############################################################################################


