library("dplyr")
library("ggplot2")
library("plotly")

# Creating bar plot to see relationship between weather and # of collisions.

draw_bar_plot <- function(dataframe) {
  filter_dataframe <- dataframe %>%
    filter(!is.na(WEATHER) | WEATHER != "{}")
  plot <- ggplot(data = filter_dataframe) +
    geom_bar(mapping = aes(x = WEATHER, fill = SEVERITYDESC)) +
    labs(x = "Weather Type", y = "Number of Collisions",
         title = "Number of Collisions vs. Weather Type ") +
    coord_flip()
  return(plot)
}