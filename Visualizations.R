# "ggplot2" package
#If using for first time, uncomment this line to install "ggplot2" package
#install.packages("ggplot2")
library(ggplot2)

##############################################################################################

# Surface plot - 3D to 2D
# ..level.. - differentiates colour based on class specified 
# top layer will be the most interior contour
ggplot(faithfuld,  aes(eruptions, waiting)) + geom_contour(aes(z = density, col = ..level..))

ggplot(faithfuld,  aes(eruptions, waiting)) + geom_raster(aes(fill=density))

#Bubble plot - suitable for small data
ggplot(faithfuld[seq(from = 1, to = 100, by = 10),], aes(eruptions, waiting)) + 
  geom_point(aes(size = density) , alpha = 1/3) + scale_size_area()

##############################################################################################

# Data frame representation
y = c(40, 15, 30)
x = c(1, 2, 3)
bonus = c(4, 1.5, 3)
df_sample = data.frame(x = x, y = y, bonus = bonus)

# Plots BoxPlot
ggplot(df_sample, aes(x,y, ymin = y-bonus, ymax = y+bonus)) + geom_crossbar()
# Range - Line ; (x,y) - point
ggplot(df_sample, aes(x,y, ymin = y-bonus, ymax = y+bonus)) + geom_pointrange()
# Curve fit of entire points
ggplot(df_sample, aes(x,y, ymin = y-bonus, ymax = y+bonus)) + geom_smooth()
# Line fit of entire points
ggplot(df_sample, aes(x,y, ymin = y-bonus, ymax = y+bonus)) + geom_smooth(stat = "identity")
# Similar to Box Plot
ggplot(df_sample, aes(x,y, ymin = y-bonus, ymax = y+bonus)) + geom_errorbar()
# Range - Line
ggplot(df_sample, aes(x,y, ymin = y-bonus, ymax = y+bonus)) + geom_linerange()
# Ribbon to analyse the range pattern of the of all possible points
ggplot(df_sample, aes(x,y, ymin = y-bonus, ymax = y+bonus)) + geom_ribbon()

##############################################################################################

# Weighted Data - Size
ggplot(midwest, aes(percwhite, percbelowpoverty)) + 
  geom_point(aes(size = poptotal)) + 
  geom_smooth(method = "lm") +
  scale_size_area() +
  labs(x = "White Percentage", y = "People Below Poverty",
       caption = "Source: midwest")

##############################################################################################

# Maps - Vector Boundaries
  #map_data -> turns data from map package into data suitable for ggplot2
michigan_counties = map_data("county", "michigan")
michigan_counties

# Plotting the map with boundaries by grouping them accordingly
  # coord_quickmap() -> used to plot earth in 2D flat surface
ggplot(mi_counties, aes(long, lat)) + 
  geom_polygon(aes(group = subregion), fill = NA, color = "red") +
  coord_quickmap()

##############################################################################################

# Maps - metadata
  # Taking cities of Michigan 
mi_cities = maps::us.cities
mi_cities

# Plotting Michigan cities and differentiating based on population
ggplot(mi_cities, aes(long, lat)) + geom_point(aes(size = pop)) + 
  coord_quickmap() +
  scale_size_area()

# Taking counties of Michigan 
michigan_counties = map_data("county", "michigan")
michigan_counties

# Plotting cities and counties of Michigan from diferent datasets in one plot
ggplot(mi_cities, aes(long, lat)) + 
  geom_polygon(aes(group = subregion), michigan_counties, fill = NA, color = "grey50") +
  geom_point(aes(size = pop, color = "red")) +
  scale_size_area() +
  coord_quickmap()

##############################################################################################

# Dividing "diamonds" dataset into 15 bins 
  # and finding the count of each cut type in each depth value(INT)
    # using frequency polygon and histogram

ggplot(diamonds, aes(depth)) + 
  geom_freqpoly(aes(color = cut), bins = 15, na.rm = TRUE) +
  xlim(55,70)

ggplot(diamonds, aes(depth)) + 
  geom_histogram(aes(fill = cut), bins = 15, na.rm = TRUE) +
  xlim(55,70)

##############################################################################################

# Overplotting

sample_overplot_df = data.frame(x = rnorm(1000), y = rnorm(1000))
sample_overplot = ggplot(sample_overplot_df, aes(x,y))
sample_overplot + geom_point()

# Ways to get rid of overplotting data
  # Hollow Circles
sample_overplot + geom_point(shape = 1)
  # Setting up transparencies
sample_overplot + geom_point(alpha = 1/3)
  # Plot as 2DBins
sample_overplot + geom_bin2d()
  # Plot as Hexagons
sample_overplot + geom_hex(bins = 15)

##############################################################################################

# Statistical summaries
  # Bar plot of count of items in each diamond color
ggplot(diamonds, aes(color)) + geom_bar()
  # stat = summary_bin performs aggregation of data rather than counting occurences
    #Useful for finding mean value of a quantity
ggplot(diamonds, aes(color, price)) + geom_bar(stat = "summary_bin", fun.y = mean)
  # stat_summary_2d -> Data divided into bins of x and y,then z values in each cell are summarised
    # z values are summaried for each raster pixel(BIN) based on mean of that pixel
ggplot(diamonds, aes(table, depth, z = price)) + 
  geom_raster(stat = "summary_2d", binwidth = 1, fun = mean) +
  xlim(50, 80)
  
##############################################################################################