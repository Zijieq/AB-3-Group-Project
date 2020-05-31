library("shiny")
library("plotly")
library("leaflet")

# load the ui and server
source("UI/app_ui.R")
source("Server/app_server.R")
source("scripts/MAP.R")
source("scripts/bar_plot.R")


shinyApp(ui = ui, server = server)