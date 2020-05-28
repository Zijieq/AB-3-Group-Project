page_one_sidePanel <- sidebarPanel(
  sliderInput(
    "slide",
    label = "injured range",
    min = 0,
    max = 15,
    value = c(0, 15)
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