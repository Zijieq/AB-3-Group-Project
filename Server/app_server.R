library(dplyr)
traffic_collision <-
  read.csv("data/lat_long.csv", stringsAsFactors = FALSE,
           fileEncoding = "latin1")

server <- function(input, output) {
  # Create traffic map visualization based on user inputs.
    output$traffic_map <- renderLeaflet({
    relative_data <- traffic_collision %>%
      filter(input$Select == SEVERITYDESC) %>%
      filter(as.Date(INCDATE) >= input$dateRange[1]
             & as.Date(INCDATE) <= input$dateRange[2])
    draw_map(relative_data)
    })
    # Create bar plot visualization based on user inputs.
    output$plot <- renderPlotly({
    relative_data <- traffic_collision %>%
      filter(WEATHER != "") %>%
      filter(WEATHER == input$weather)
    draw_bar_plot(relative_data)
    })
    # Create pie chart visualization based on user inputs.
    output$chart <- renderPlotly({
      if (input$severity == "All") {
        draw_pie_chart(traffic_collision)
      } else {
        relative_data <- traffic_collision %>%
          filter(SEVERITYDESC == input$severity)
        draw_pie_chart(relative_data)
      }
    })
}
