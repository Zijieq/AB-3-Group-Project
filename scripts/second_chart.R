library("dplyr")
library("ggplot2")
library("plotly")

# Draw the pie chart with following function.
draw_pie_chart <- function(dataframe) {
  aggregate_address_type <- dataframe %>%
    group_by(ADDRTYPE) %>%
    summarize(appearance = n())
  plot <- plot_ly(aggregate_address_type, labels = ~ADDRTYPE,
                  values = ~appearance,
          type = "pie")
  plot <- plot %>%
    layout(
      title = "Percent Distribution of Address Type in Collisions 2017"
      )
  return(plot)
}
