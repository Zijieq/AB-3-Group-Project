library("dplyr")
library("ggplot2")
library("plotly")

# Create table for summary data, grouped by collision types.
summary_table <- function(dataframe) {
  grouped_dataframe <- dataframe %>%
    filter(COLLISIONTYPE != "") %>%
    unique() %>%
    group_by(COLLISIONTYPE) %>%
    summarise(
      total_num_injuries = sum(INJURIES),
      total_num_serious_injuries = sum(SERIOUSINJURIES),
      total_num_fatalities = sum(FATALITIES),
      avg_num_indv_involved = mean(PERSONCOUNT, na.rm = TRUE),
      avg_num_vehicles = mean(VEHCOUNT, na.rm = TRUE)
    ) %>%
    arrange(-total_num_injuries) %>%
    head(10)
}
