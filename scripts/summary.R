rm(list = ls())
library(lintr)
library(dplyr)
library(scales)




traffic_collision<- read.csv("./data/lat_long.csv", stringsAsFactors=FALSE, fileEncoding="latin1")




get_summary_info <- function(dataset) {
  library(stringr)
  
  ret <- list()
  ret$length <- length(dataset)
  
  average_n_involved <- traffic_collision %>% 
    summarise(involved = mean(PERSONCOUNT,na.rm = TRUE)) %>% 
    pull(involved)
  
  ret$average_n_involved <- average_n_involved
  
  average_survival_rate <-  traffic_collision%>%
    filter(PERSONCOUNT!=0) %>% 
    summarise(survival_rate = percent(mean((PERSONCOUNT-FATALITIES)/PERSONCOUNT,na.rm = TRUE),
                                      accuracy = 0.01)) %>% 
    pull(survival_rate)
  
  ret$average_survival_rate <- average_survival_rate
  
  weather_most_collision <- traffic_collision %>% 
    group_by(WEATHER) %>% 
    summarise(n_collision=n()) %>% 
    filter(n_collision==max(n_collision,na.rm = TRUE)) %>% 
    pull(WEATHER)
  
  ret$weather_most_collision <- weather_most_collision
  
  weather_fatal <- dataset %>% 
    group_by(WEATHER) %>% 
    summarise(n_fatalities = sum(FATALITIES,na.rm = TRUE)) %>%
    filter(n_fatalities == max(n_fatalities,na.rm = TRUE)) %>%
    pull(WEATHER)
  
  ret$weather_fatal <- weather_fatal
  
  rate_injuries_speeding <-  dataset%>% 
    filter(SPEEDING=="Y") %>% 
    filter(PERSONCOUNT!=0) %>% 
    summarise(average_injury_rate=percent(mean(INJURIES/PERSONCOUNT,na.rm = TRUE),
                                          accuracy = 0.01)) %>% 
    pull(average_injury_rate)
  
  ret$injuries_speeding <- rate_injuries_speeding
  
  return (ret)
}


get_summary_info(traffic_collision)