# Load all libraries.
library("shiny")
library("plotly")
library("leaflet")
library("dplyr")

# load the ui and server
source("UI/app_ui.R")
source("Server/app_server.R")


shinyApp(ui = ui, server = server)