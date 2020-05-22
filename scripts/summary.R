rm(list = ls())
library(lintr)
library(dplyr)


#set up the working directory in which the dataset is stored

collision_data <- read.csv('lat_long.csv', stringsAsFactors=FALSE, fileEncoding="latin1")

colnames(collision_data)

summary(collision_data)

column_name <- colnames(collision_data)
n_row <- nrow(collision_data)
n_column <- ncol(collision_data)


# Average number of people involved in collisions 
average_n_involved <- collision_data %>% 
  summarise(involved = mean(PERSONCOUNT,na.rm = TRUE)) %>% 
  pull(involved)

#Average survival rate
average_survival_rate <- collision_data %>%
  filter(PERSONCOUNT!=0) %>% 
  summarise(survival_rate = percent(mean((PERSONCOUNT-FATALITIES)/PERSONCOUNT,na.rm = TRUE),
                                    accuracy = 0.01)) %>% 
  pull(survival_rate)

# What weather has the most collisions occurred
weather_most_collision <- collision_data %>% 
  group_by(WEATHER) %>% 
  summarise(n_collision=n()) %>% 
  filter(n_collision==max(n_collision,na.rm = TRUE)) %>% 
  pull(WEATHER)

# Under which weather the fatalities become the highest?
weather_fatal <- collision_data %>% 
  group_by(WEATHER) %>% 
  summarise(n_fatalities = sum(FATALITIES,na.rm = TRUE)) %>%
  filter(n_fatalities == max(n_fatalities,na.rm = TRUE)) %>%
  pull(WEATHER)

# Average rate of injuries in the case of speeding
rate_injuries_speeding <- collision_data %>% 
  filter(SPEEDING=="Y") %>% 
  filter(PERSONCOUNT!=0) %>% 
  summarise(average_injury_rate=percent(mean(INJURIES/PERSONCOUNT,na.rm = TRUE),
                                        accuracy = 0.01)) %>% 
  pull(average_injury_rate)



