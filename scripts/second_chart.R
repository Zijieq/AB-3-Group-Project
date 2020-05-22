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
    layout(title = "The percent distribution of address type in collisions 2017")
  plot
}

