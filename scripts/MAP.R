# load neccessary packages
# install.packages("ggmap")
# install.packages("ggalt")

library("dplyr")
library("ggplot2")
library("plotly")
library("ggmap")
library("ggplot2")
library("ggalt")
library("leaflet")

# connect API key with R
# register_google(key = "AIzaSyBuvi7L7rY8RLZSlXLFoq8YULs-rXy_7qw", write = TRUE)

# reading the dataset
# traffic_collision <- read.csv("data/Collisions.csv", stringsAsFactors = FALSE)
# 
# # typeof(pull(traffic_collision, location))
# 
# lat_long_column <- traffic_collision %>%
#   filter(substring(INCDATE, 1, 4) == "2017") %>%
#   mutate_geocode(LOCATION)
# 
# # Washigotn state traffic status
# leaflet(data = lat_long_column) %>%
#   addProviderTiles("CartoDB.Positron") %>%
#   setView(lat = 47.6, lng = -122.3, zoom = 10) %>%
#   addMarkers(
#     clusterOptions = markerClusterOptions()
#   )




draw_map <- function(dataframe) {
  lat_long_column <- dataframe %>%
    filter(substring(INCDATE, 1, 4) == "2017") %>%
    mutate_geocode(LOCATION) %>%
    filter(!is.na(lon) & !is.na(lat))
  
    map <- leaflet(data = lat_long_column) %>%
    addProviderTiles("CartoDB.Positron") %>%
    setView(lat = 47.6, lng = -122.3, zoom = 10) %>%
    addMarkers(
      clusterOptions = markerClusterOptions(),
      popup = ~paste(sep = "<br/>",
                     "Location: ", LOCATION,
                     " Injured: ", INJURIES)
    )
  return(map)
}

