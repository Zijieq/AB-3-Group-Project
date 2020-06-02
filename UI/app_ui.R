# Create side panel for severity selector and date input.
page_one_sidepanel <- sidebarPanel(
  selectInput(
    "Select",
    "Select Type of Collision",
    c(
      "Fatality Collision" = "Fatality Collision",
      "Injury Collision" = "Injury Collision",
      "Property Damage Only Collision" = "Property Damage Only Collision",
      "Serious Injury Collision" = "Serious Injury Collision"
    ),
    selected = "",
  ),
  dateRangeInput("dateRange",
    label = "Date range input: yyyy-mm-dd",
    start = "2017-01-01", end = "2017-12-31"
  )
)

# Main panel for page one with visualization and paragraphs.
page_one_mainpanel <- mainPanel(
  h2("Traffic Collisions in Washington State 2017"),
  p("A question we try to use this map to answer is
    which area of Washington State had the highest
    amount of traffic collisions in different months of 2017,
    and which type of collisions happened in which areas in Seattle 2017"),
  p("Map is a better choice to build visualization to tell
    users how the collisions spread out in Washington State.
    And it is clear to tell users how many injuries in which areas
    by setting a range users would like to know.As you zoom in to
    look at the information in more detail, most of the traffic collisions
    happened within the downtown area of Seattle (nearly 2800 occurrences),
    followed by area which is in the west of Seattle
    (around 1800 occurrences). The farther away from downtown
    Seattle and Tacoma, the fewer traffic collisions occurred."),
  leafletOutput("traffic_map"),
  p("From the visualization, we can see the property damage only
    collision happened most and occurred most in Seattle Downtown
    and randomly spread out in different cities around Seattle.
    And other types of collisions happened most in Seattle and
    seldom of collisions happened in cities around Seattle.")
)

# Creating tab panel.
page_one <- tabPanel(
  "Map",
  sidebarLayout(
    page_one_sidepanel,
    page_one_mainpanel
  )
)

# Side panel for selecting weather for page two.
page_two_sidepanel <- sidebarPanel(
  checkboxGroupInput(
    inputId = "weather",
    label = "Select Weather of Collision",
    choices = c(
      "Clear" = "Clear",
      "Snowing" = "Snowing",
      "Sleet/Hail/Freezing Rain" = "Sleet/Hail/Freezing Rain",
      "Raining" = "Raining",
      "Overcast" = "Overcast",
      "Fog/Smog/Smoke" = "Fog/Smog/Smoke",
      "Blowing Sand/Dirt" = "Blowing Sand/Dirt",
      "Other" = "Other"
    ),
    selected = "Clear"
  )
)

# Main panel for page two, consisting of visualization and paragraphs.
page_two_mainpanel <- mainPanel(
  h2("Bar Chart: Number of Collisions vs. Weather Type"),
  p(
    "A question we wanted to answer was: what is the relationship between the
    weather and the severity of a collision?"
  ),
  p(
    "The following bar chart displays the number of collisions for each
    weather type in Washington in 2017. It is further broken down by how severe
    the collision was, as shown in the color-coded bars."
  ),
  plotOutput("plot"),
  p(
    "From this visualization, we can conclude that in all weather types, the
    most common severity description reported in 2017 was Property Damage Only
    Collision followed by Injury Collision. The least common severity
    description recorded was Fatality Collision. Among all other weather types,
    Clear was the weather type that had the most Property Damage Only
    Collision, Injury Collision, and Serious Injury Collision. It was
    interesting that the clear weather type had the most collisions total
    and the most serious injury collisions compared to raining or overcast."
  )
)

# Creating tab panel for page two.
page_two <- tabPanel(
  "Bar Chart",
  sidebarLayout(
    page_two_sidepanel,
    page_two_mainpanel
  )
)

ui <- navbarPage(
  "2017 Collisions in Washington",
  page_one,
  page_two
)
