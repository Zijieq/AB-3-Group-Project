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
  p("A question we try to use this map to answer is:
    Which area of Washington had the highest
    amount of traffic collisions in different time frame of 2017,
    and which type of collisions happened in which areas in Seattle 2017?"),
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
    label = "Select Weather Type",
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
  h2("Bar Plot: Number of Collisions vs. Weather Type"),
  p(
    "A question we want to answer is: what is the relationship between the
    weather and the severity of a collision?"
  ),
  p(
    "The following bar plot displays the number of collisions for each
    weather type in Washington in 2017. It is further broken down by how severe
    the collision was, as shown in the color-coded bars."
  ),
  plotOutput("plot")
)

# Creating tab panel for page two.
page_two <- tabPanel(
  "Bar Plot",
  sidebarLayout(
    page_two_sidepanel,
    page_two_mainpanel
  )
)

# Side panel for selecting severity of collision for page three.
page_three_sidepanel <- sidebarPanel(
  radioButtons(
    "severity",
    "Select Severity of Collision",
    c("All" = "All",
      "Fatality Collision" = "Fatality Collision",
      "Injury Collision" = "Injury Collision",
      "Property Damage Collision" = "Property Damage Only Collision",
      "Serious Injury Collision" = "Serious Injury Collision"
    ),
    selected = "All"
  )
)

# Main panel for page three, consisting of visualization and paragraphs.
page_three_mainpanel <- mainPanel(
  h2("Pie Chart: Percent of Address Types involved in Various Collision Severities"),
  p(
    "A question we want to answer is: How does the percentage of different
    address types change in different levels of collision severities?"
  ),
  p(
    "The following pie charts display the percent distribution of each type of
    address in different level of severity of collision in Washington in 2017.
    It also comes with a pie chart for the collisions in total."
  ),
  plotlyOutput("chart")
)


# Creating tab panel for page three.
page_three <- tabPanel(
  "Pie Chart",
  sidebarLayout(
    page_three_sidepanel,
    page_three_mainpanel
  )
)

# Summary/key takeaways page
page_summary_mainPanel <- mainPanel(
  h2("Key Takeaways"),
  p(
    "From the questions that inspired us to explore this dataset, we have found 
    some patterns in the collisions that have occured in Washington in 2017."
  ),
  p(
    "The first subject we wanted to explore was the areas in Washington that had
    more collisions, and whether a specific time frame had more/less collisions. 
    The map could be filtered down to show specific collision severities as well
    as date range. Overall we noticed that more traffic collisions occured in
    Downtown Seattle area and gradually got less as it moved farther away from
    the city. Property Damage Only was the most frequent collision in Seattle."
  ),
  p(
    "Secondly, we wanted to determine the relationship between the weather
    and number of collisions. We visualized which weather type had the
    most collisions, and broke down the collision numbers by specifying
    the severity description of the collision. From the bar plot visualization,
    concluded that in all weather types, the most common severity description 
    was Property Damage Only Collision followed by Injury Collision. 
    The least common severity description recorded was Fatality Collision.
    Among all other weather types, Clear was the weather type that had the
    most Property Damage Only Collision, Injury Collision, and Serious Injury
    Collision. It was interesting to see that the clear weather type had the
    most collisions total and the most serious injury collisions compared to
    raining or overcast."
  ),
  p(
    "Lastly, we looked at the relationship between address types and severity
    of a collision. In the pie chart, we visualized the percentage of address 
    types involved in collisions. Using the radio buttons, a user could then
    filter which severity of collision they wanted to use to filter the pie chart.
    According to the pie chart, the most common severity description reported in
    2017 was Property Damage Only Collision followed by Injury Collision.
    The least common severity description recorded was Fatality Collision.
    Among all other weather types, Clear was the weather type that had the
    most Property Damage Only Collision, Injury Collision, and Serious Injury
    Collision. It was interesting that the clear weather type had the most 
    collisions total and the most serious injury collisions compared to raining
    or overcast."
  )
)

# Tab panel for Summary page.
page_summary <- tabPanel(
  "Summary",
  page_summary_mainPanel
)

ui <- fluidPage(
  includeCSS("style.css"),
  navbarPage(
  "2017 Collisions in Washington",
  page_one,
  page_two,
  page_three,
  page_summary
  )
)
