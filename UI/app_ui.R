# Create side panel for severity selector and date input.
sidePanel1 <- sidebarPanel(
  selectInput(
    "Select",
    "Select Type of Collision",
    unique(traffic_collision$SEVERITYDESC),
    selected = "",
  ),
  dateRangeInput("dateRange",
                 label = "Date range input: yyyy-mm-dd",
                 start = "2017-01-01", end = "2017-12-31"
  )
)

# Main panel for page one with visualization and paragraphs.
mainPanel1 <- mainPanel(
  h2("Traffic Collisions in Washington State 2017"),
  p("Map is a better choice to build visualization to tell
    users how the collisions spread out in Washington State.
    And it is clear to tell users how many injuries in which areas
    by setting a range users would like to know."),
  leafletOutput("traffic_map")
)

# Creating tab panel.
page_one <- tabPanel(
  "Map",
  sidebarLayout(
    sidePanel1,
    mainPanel1
  )
)

# Side panel for selecting weather for page two.
sidePanel2 <- sidebarPanel(
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
mainPanel2 <- mainPanel(
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
    sidePanel2,
    mainPanel2
  )
)

ui <- navbarPage(
  "2017 Collisions in Washington",
  page_one,
  page_two
)