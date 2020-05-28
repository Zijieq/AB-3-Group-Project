traffic_collision <- read.csv("data/lat_long.csv", stringsAsFactors = FALSE, fileEncoding="latin1")

server <- function(input, output){
  output$traffic_map <- renderLeaflet({
    relative_data <- traffic_collision %>%
      filter(INJURIES >= input$slide[1] 
             & INJURIES <= input$slide[2])
    
    draw_map(relative_data)
  })
}