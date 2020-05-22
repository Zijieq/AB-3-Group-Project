rm(list = ls())
library(lintr)
library(dplyr)


#set up the working directory in which the dataset is stored
collision_data <- read.csv('Collisions.csv', stringsAsFactors=FALSE)
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

# which year has the most collision
most_collision_year <- collision_data %>% 
  mutate(DATE = as.Date(INCDATE,"%Y/%m/%d"),
         year = as.numeric(format(DATE,"%Y"))) %>% 
  group_by(year) %>% 
  summarise(n_collision=n()) %>% 
  filter(n_collision==max(n_collision,na.rm = TRUE)) %>% 
  pull(year)

# Which year has the most drug or alcohol related fatalities
drug_alcohol_fatalities_year <- collision_data %>%
  mutate(DATE = as.Date(INCDATE,"%Y/%m/%d"),
         year = as.numeric(format(DATE,"%Y"))) %>%
  filter(UNDERINFL %in% c("1","Y")) %>% 
  group_by(year) %>% 
  summarise(fatalities_year=sum(FATALITIES,na.rm = TRUE)) %>% 
  filter(fatalities_year == max(fatalities_year,na.rm = TRUE)) %>% 
  pull(year)



