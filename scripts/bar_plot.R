library("dplyr")
library("ggplot2")

# Creating bar plot to see relationship between weather and type of collisions.
draw_bar_plot <- function(dataframe) {
  filter_dataframe <- dataframe %>%
    filter(WEATHER != "") %>%
    unique()
  plot <- ggplot(data = filter_dataframe) +
    geom_bar(mapping = aes(x = WEATHER, fill = SEVERITYDESC)) +
    labs(x = "Weather Type", y = "Count",
         title = "Number of Collisions vs. Weather Type") +
    coord_flip()
  return(plot)
}
