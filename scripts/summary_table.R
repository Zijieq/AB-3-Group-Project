library("tidyverse")

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
    rename(
      "Collision Type" = COLLISIONTYPE,
      "Total Injuries" = total_num_injuries,
      "Total Serious Injuries" = total_num_serious_injuries,
      "Total Fatalities" = total_num_fatalities,
      "Average # Individuals Involved" = avg_num_indv_involved,
      "Average # of Vehicles Involved" = avg_num_vehicles
    ) %>%
    head(10)
  return(grouped_dataframe)
}
