# "leaflet" package
# If using for first time, uncomment this line to install "leaflet" package
# install.packages("leaflet")
library(leaflet)

##############################################################################################

# Positioning marker in specified location using Leaflet - a JS "Map" library
sample_map = leaflet() %>% addTiles() %>% 
             addMarkers(lng = 80.161150, lat = 13.021940, popup = "Home")
sample_map

##############################################################################################

# Locating 20 earthquake occured areas near Fiji since 1964 (quakes dataset) 
quake_data = quakes[1:20,]
quake_data

quake_map = leaflet(data = quake_data) %>% addTiles() %>%
            addMarkers(lng = ~long, lat = ~lat, popup = ~as.character(mag))
quake_map

##############################################################################################

# Emphasizing Labels for Markers
  #paste() -> To concatenate multiple strings and split them based on a seperator
LabelContent = paste(sep = "<br>", 
                     "<b>KAILASH - LINKEDIN</b>",
                     "<a href = 'https://linkedin.com/in/kailash-s-063207150'>KAILASH</a>"
                     )

My_Home = leaflet() %>% addTiles() %>% 
  addPopups(lng = 80.161150, lat = 13.021940, 
             popup = LabelContent, options = popupOptions(closeButton = FALSE))
My_Home

##############################################################################################

# Plotting Leaflet for customized input
  #read.csv -> reads a file in table format and generates dataframe for the same 
  #Textconnection -> txt into csv file format
dataset_df = read.csv(textConnection(
             "Name, Latitude, Longitude
             Samurai Noodele, 47.597131, -122.327298
             Kukai Ramen, 47.6154, -122.327157
             Tsukushinbo, 47.59987, -122.32678"))

dataset_df

custom_map = leaflet(data = dataset_df) %>% addTiles() %>% 
  addMarkers(lng = ~Longitude, lat = ~Latitude, popup = ~as.character(Name))
custom_map

##############################################################################################

          