# Load all libraries. 
library("shiny")
library("plotly")
library("leaflet")
library("dplyr")

# load the ui and server
source("UI/app_ui.R")
source("Server/app_server.R")
source("scripts/MAP.R")
source("scripts/bar_plot.R")
source("scripts/second_chart.R")

shinyApp(ui = ui, server = server)