traffic_collision <- read.csv("data/lat_long.csv", stringsAsFactors = FALSE, fileEncoding="latin1")

server <- function(input, output){
  output$traffic_map <- renderLeaflet({
    
    relative_data <- traffic_collision %>%
      filter(input$Select == traffic_collision$SEVERITYDESC) %>%
      filter(as.Date(INCDATE) >= input$dateRange[1]
             & as.Date(INCDATE) <= input$dateRange[2])
    
    draw_map(relative_data)
    
  })
}