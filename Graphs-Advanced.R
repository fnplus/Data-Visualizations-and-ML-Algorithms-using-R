# "ggplot2" package
  #If using for first time, uncomment this line to install "ggplot2" package
  #install.packages("ggplot2")
library(ggplot2)
# Mapping "displ - displacement" and "cty - city mileage" attributes using ggplot 
  # Differentiating points based on "manufacturer" attribute
ggplot(mpg, aes(displ, cty, colour = manufacturer)) + geom_point()

##############################################################################################

# Individual data visualization of the dataset based on an attribute -> facet_wrap(attr)
ggplot(mpg, aes(displ, cty)) + geom_point() + facet_wrap("class")

# Data visulaization in different formats
  #geom_smooth() -> computes conditional mean using LO(W)ESS method -> discrete to continuous
    # se = FALSE - hides the error shaded region around the curve
ggplot(mpg, aes(displ, cty)) + geom_smooth(se = FALSE) + facet_wrap("class")
ggplot(mpg, aes(displ, cty)) + geom_boxplot() + facet_wrap("class")

#geom_smooth by default takes all data points into consideration to fit the curve
  #if span value is lesser than 1, it takes that much proportion of nearest values
ggplot(mpg, aes(displ, cty)) + geom_smooth(span = 1) 
ggplot(mpg, aes(displ, cty)) + geom_smooth(span = 0.2) 

##############################################################################################

# geom_jitter ; geom_violin -> To avoid overplotting
ggplot(mpg, aes(drv, hwy)) + geom_point()
  #Adds some random noise and more apt for smaller dataset
ggplot(mpg, aes(drv, hwy)) + geom_jitter()
  #Calculates density estimate of distribution
ggplot(mpg, aes(drv, hwy)) + geom_violin()

##############################################################################################

# Histogram and Frequency polygon used to study one attribute in detail
ggplot(mtcars,aes(cyl)) + geom_histogram(bins = 5)
ggplot(mtcars,aes(cyl)) + geom_freqpoly(bins = 5)

# Histogram and Frequency polygon of an attribute differentiated with repsect to another attribute
ggplot(mpg, aes(displ, colour = drv)) + geom_freqpoly(bins = 5)
ggplot(mpg, aes(displ, fill = drv)) + geom_histogram(bins = 5) + facet_wrap("drv", ncol = 1)

##############################################################################################

# Bar charts
marks = data.frame(stud = c("SK7", "CR7", "Messi"), mark = c(98, 90, 100))
print(marks)

# Use stat = "identity" to represent value of data rather than count
  # Need 2 aesthetic variables
ggplot(marks, aes(stud, mark)) + geom_bar(stat = "identity") + geom_point()
ggplot(marks, aes(stud, mark)) + geom_point()

# Time series
ggplot(economics, aes(date, uempmed)) + geom_line()

##############################################################################################

# Basic Plot types using ggplot
sample_text = data.frame(x = c(1,2,3), y = c(10,15,35), label = c("A","B","C"))
print(sample_text)

sample_plot = ggplot(sample_text, aes(x, y, label = label)) + labs(x = "ID", y = "Value")
print(sample_plot)

sample_plot+geom_point()+ggtitle("Point")
  # Plots the value by representing as labels
sample_plot+geom_text()+ggtitle("Text")
sample_plot+geom_bar(stat = "identity")+ggtitle("Bar chart")
sample_plot+geom_polygon()+ggtitle("Polygon")
sample_plot+geom_raster()+ggtitle("Raster")

##############################################################################################

# Usecase - highlighting specific portion of data using conditons in the plot
  #Using ggalt for first time, install the package
  #install.packages("ggalt")
library(ggalt)

  # Filtering data from midwest dataset based on poptotal and area constraints
midwest_select = midwest[midwest$poptotal > 350000 & midwest$poptotal < 500000 & 
                         midwest$area > 0.01 & midwest$area < 0.1, ]
print(midwest_select)

  # Plotting
ggplot(midwest, aes(x = area, y = poptotal)) + geom_smooth() +
       #Differentiating points based on "popdensity" and "State"
       geom_point(aes(color = state, size = popdensity)) +
       xlim(c(0, 0.1)) +
       ylim(c(0, 500000)) +
       geom_encircle(aes(x = area, y = poptotal),
                     data = midwest_select,
                     color = "red",
                     size = 4,
                     expand = 0.1) +
       labs(x = "Area", y = "Population",
            title = "Area vs Population in Midwest",
            caption = "Source: midwest dataset")

##############################################################################################