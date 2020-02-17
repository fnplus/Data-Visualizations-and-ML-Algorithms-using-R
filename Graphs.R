# 2D Pie chart
  # x should be a numeric vector
x = c(10, 30, 50, 100)
label = c("Data1", "Data2", "Data3", "Data4")
pie(x, label, col = rainbow(length(x)), main = "SAMPLE 2D PIE CHART" )

##############################################################################################

# To use 3D charts install "plotrix" package and import it
  #If using for first time, uncomment this line to install plotrix package
  #install.packages("plotrix")
library(plotrix)

# 3D Pie chart
x = c(10, 30, 50, 100)
label = c("Data1", "Data2", "Data3", "Data4")
  # No need for "col" parameter to be specified
pie3D(x, labels = label, explode = 0.05,  main = "SAMPLE 3D PIE CHART")

##############################################################################################

#BarPlot
x = c(100, 75, 90, 82, 95)
students = c("S1", "S2", "S3", "S4", "S5")
  # names.arg caries label for each bar in the barplot
barplot(x, names.arg = students, col = rainbow(length(x)), 
        xlab = "Students", ylab = "Marks", main = "BAR PLOT - STUDENT MARKS")

##############################################################################################

#Stack Barplot
m1 = c(100, 75, 90, 82, 95)
m2 = c(40, 70, 60, 54, 81)
m3 = c(20, 12, 50, 23, 49)
  # Creating a matrix with 3 rows and 5 columns arranging the data row wise
values = matrix(c(m1,m2,m3), nrow = 3, ncol = 5, byrow = TRUE)
print("MATRIX OF MARKS SECURED BY 5 STUDENTS IN 3 SUBJECTS")
print(values)
students = c("S1", "S2", "S3", "S4", "S5")
subjects = c("M1", "M2", "M3")
barplot(values, names.arg = students, col = rainbow(length(subjects)), 
        xlab = "Students", ylab = "Marks", main = "STACKED BAR PLOT - STUDENT MARKS SPLIT UP")
  #Adding legend for 3 subjects and specifying position of legend in the graph - 0,230
legend(0,230, cex = .6, subjects, fill = rainbow(length(subjects)))

##############################################################################################

#Data of Boxplots - taking "mtcars" dataset in R
count = 1
cyl4 = c()
cyl6 = c()
cyl8 = c()
for(i in mtcars[,'cyl'])
{
  
  if(i == 4)
  {
    cyl4 = c(cyl4, mtcars[count,'mpg'])
  }
  if(i == 6)
  {
    cyl6 = c(cyl6, mtcars[count,'mpg'])
  }
  if(i == 8)
  {
    cyl8 = c(cyl8, mtcars[count,'mpg'])
  }
  count = count+1
}
print("MPG for 4 cylinders")
print(sort(cyl4))
print("MPG for 6 cylinders")
print(sort(cyl6))
print("MPG for 8 cylinders")
print(sort(cyl8))

#BoxPlot
boxplot(mpg ~ cyl, data = mtcars,
        xlab = "No of Cylinders", ylab = "Miles per Gallon", main = "BOXPLOT SAMPLE",
        col = rainbow(length(mpg ~ cyl)))

##############################################################################################

# Histogram
# Seq(start, end, by = range of each bin)
v = c(10,20,30,4,5,35,60)
hist(v, breaks = seq(0,100, by=20), main = "Histogram Plot", col = "red", xlab = "Values")

##############################################################################################

# Line charts - 1D
v1 = c(10,20,30,4,5,35,60)
v2 = c(15,25,35,40,15,25,10)
# Plot types -> l, p, b, o, s, h
plot(v1, type = "o", col = rainbow(length(v1)), xlab = "Index", ylab = "Frequency", 
         main = "Line Plot")
# To plot another line in same graph
lines(v2, type = "o", col = rainbow(length(v2)))

##############################################################################################

# ScatterPlot
input = mtcars[,c('mpg', 'wt')]
plot(x = input$mpg, y = input$wt, xlim = c(10,40), ylim = c(0,6.5), 
     xlab = "Miles per gallon", ylab = "Weight of the car", main = "Scatter Plot")

# Scatterplot with one hot encoding using pch
with(iris, plot(Petal.Length, Petal.Width , pch = as.integer(Species)))

##############################################################################################

# Gamma Distribution as Histogram and density function
  # rgamma(n, shape, scale)
sampledata = rgamma(500,1,2)
print(sampledata)
  # Plotting Histogram and Density function for random gamma function generated
hist(sampledata, prob = T)
lines(density(sampledata))

##############################################################################################