page_one_sidePanel <- sidebarPanel(
  selectInput(
    "Select",
    "Select type of Collision",
    c("Fatality Collision" = "Fatality Collision",
      "Injury Collision" = "Injury Collision",
      "Property Damage Collision" = "Property Damage Only Collision",
      "Serious Injury Collision" = "Serious Injury Collision"
    ), 
    selected = "",
  ),
  dateRangeInput('dateRange',
                 label = 'Date range input: yyyy-mm-dd',
                 start = "2017-01-01", end = "2017-12-31"
  )
)

page_one_mainPanel <- mainPanel(
  h2("Traffic Collisions in Washington State 2017"),
  p("Map is a better choice to build visualization to tell
    users how the collisions spread out in Washington State.
    And it is clear to tell users how many injuries in which areas
    by setting a range users would like to know."),
  leafletOutput("traffic_map")
)

page_one <- tabPanel(
  "Map",
  sidebarLayout(
    page_one_sidePanel,
    page_one_mainPanel
  )
)


ui <- navbarPage(
  "Collision",
  page_one
)