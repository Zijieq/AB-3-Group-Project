# A single page overview
page_zero <- tabPanel(
  "Introduction",
  h1("Analysis Overview"),
  p("We retrieved the 2017 Washington State collisions dataset from
  the official",
  tags$a(href = "https://data.seattle.gov/Land-Base/Collisions/9kas-rb8d",
         "Seattle Government Website"),
  "to present collisions that happened in Washington State at a macroscopic
  level. Our goal is to help inform the public of the traffic collision rates
  by analyzing various variables such as weather, address type, and date.
  We have included three interactive visualizations of our findings to answer
  questions we were interested in."),
  img(
    src = "car.jpg",
      height = 400, width = 600),
  p(""),
  p("The three questions we will be answering are:"),
  p("- Which area in Washington had the highest amount of traffic
    collisions in different time frame of 2017, and which areas had
    more instances of a collision type?"),
  p("- What is the relationship between the weather and the severity of
    a collision?"),
  p("- How does the percentage of different address types changes with
    the change of different levels of severity in collisions?"),
)

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
  p("Which area of Washington had the highest amount of traffic collisions
  in different time frame of 2017, and what type of collisions happened in
    various areas in Seattle 2017?"),
  p("Map is a better choice to build visualization to tell
    users how the collisions spread out in Washington State.
    And it is clear to tell users how many injuries in which areas
    by setting a range users would like to know. As you zoom in to
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
    "What is the relationship between the weather and the severity of a
    collision?"
  ),
  p(
    "The following bar plot displays the number of collisions for each
    weather type in Washington in 2017. It is further broken down by how severe
    the collision was, as shown in the color-coded bars."
  ),
  plotlyOutput("plot")
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
  h2(
    "Pie Chart: Percent of Address Types Involved in Various Collision
    Severities"
     ),
  p(
    "How does the percentage of different address types change in different
    levels of collision severities?"
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
page_summary_mainpanel <- mainPanel(
  h2("Key Takeaways"),
  p(
    "From the questions that inspired us to explore this dataset, we found
    some patterns in the collisions that occured in Washington in 2017."
  ),
  p(
    "The first subject we wanted to explore was the areas in Washington that
    had more collisions, and whether a specific time frame had more/less
    collisions. The map could be filtered down to show specific collision
    severities as well as date range. Overall we noticed that more traffic
    collisions occured in Downtown Seattle area and gradually got less as it
    moved farther away from the city. Property Damage Only was the most
    frequent collision in Seattle. From our findings, we could suggest the
    department of transportation to implement additional safety measures,
    such as reflective strips or bright-colored signs for buildings that have
    been more susceptible to such collisions."
  ),
  HTML('<img src="MAP.png"/>'),
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
    raining or overcast. These insights suggest that there needs to be
    more emphasis in informing drivers to be cautious throughout all types of
    weather, even when it appears to be perfect and clear."
  ),
  HTML('<img src="bar_plot.png"/>'),
  p(
    "Lastly, we looked at the relationship between address types and severity
    of a collision. In the pie chart, we visualized the percentage of address
    types involved in collisions. Using the radio buttons, a user could then
    filter which severity of collision they wanted to use to filter the pie
    chart.According to the pie chart, the block address type has
    a higher appearance proportion with 62.6%. When we filtered into different
    levels of severity, the percentage distribution changed. In fatality
    collision, block takes 38.1% of the cases. In Injury Collision, block takes
    48% of the cases. In Property Damage Collisions, blocks takes 65.3% of the
    cases. And in Serious Injury Collision, block takes 50.9% of the cases.
    By looking through the data, we can saw that blocks tended to appear more
    in collisons with low level of severity but appear less in high level
    severity. Overall, we believed that blocks had a higher appearance in car
    collisions because they do not have much regulation as intersections.
    Blocks also have cars parked by the side, which makes collisions happen
    easier. One suggestion we came up with is that the traffic department
    could add more radar-enforced speed warnings in blocks with high
    collision rates so that drivers are more conscious with their speed."
  ),
  HTML('<img src="pie_chart.png"/>')
)

# Tab panel for Summary page.
page_summary <- tabPanel(
  "Summary",
  page_summary_mainpanel
)

ui <- fluidPage(
  includeCSS("style.css"),
  navbarPage(
    "2017 Collisions in Washington",
    page_zero,
    page_one,
    page_two,
    page_three,
    page_summary
  )
)
