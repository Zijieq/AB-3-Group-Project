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

# drawing a map with following function

draw_map <- function(dataframe) {
    map <- leaflet(dataframe) %>%
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

