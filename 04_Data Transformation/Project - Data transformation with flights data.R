## homework
# library nycflights13 --> for download data
install.packages("nycflights13")

# transform nycflights13

# load library
library(nycflights13)
library(tidyverse)
library(glue)
library(lubridate)

################################################################################

## ask 5 question about this dataset --> to notion
view(flights)

# load data
data("flights")
data("airlines")
data("planes")

# Data dictionary --> mean of each column in flights data
?flights


## select filter arrange mutate summarise count

################################################################################

# Q1 - Which airline is the most used and has the lowest departure and arrival delays?  

flights %>%
  group_by(carrier) %>%
  summarise(
    avg_dep_delay = mean(dep_delay, na.rm = T),
    avg_arr_delay = mean(arr_delay, na.rm = T),
    flight_times = n()
  ) %>%
  filter(avg_dep_delay < 15 & avg_arr_delay < 30) %>%
  arrange(desc(flight_times), avg_dep_delay, avg_arr_delay) %>%
  left_join(airlines, 
            by = c("carrier" = "carrier")) %>%
  select(Airline = name,
         flight_times,
         avg_dep_delay,
         avg_arr_delay
  )

################################################################################

# Q2 - Which month has the most average departure and arrival delays?

flights %>%
  group_by(month) %>%
  summarise(
    avg_dep_delay = mean(dep_delay, na.rm = T), 
    avg_arr_delay = mean(arr_delay, na.rm = T)
  ) %>%
  select(Month = month,
         avg_dep_delay,
         avg_arr_delay
  ) %>%
  arrange(Month)

################################################################################

# Q3 - In 2013, which plane were the most heavily used?

flights %>%
  filter(year == 2013, tailnum != "") %>%
  group_by(tailnum) %>%
  summarise(
    sum_distance = sum(distance),
    flights_times = n()
  ) %>%
  left_join(planes,
            by = c("tailnum" = "tailnum")) %>%
  select(tailnum,
         tailnum_year = year,
         sum_distance,
         flights_times) %>%
  arrange(desc(sum_distance))

################################################################################

# Q4 - Which plane were the most average departure delay?

flights %>%
  group_by(tailnum) %>%
  summarize(
    avg_delay = mean(dep_delay)
  ) %>%
  left_join(planes,
            by = c("tailnum" = "tailnum")) %>%
  select(tailnum,
         tailnum_year = year,
         avg_delay) %>%
  arrange(desc(avg_delay))

################################################################################

# Q5 - Which plane has good speed (distance per hours.)?

flights %>%
  mutate(mph = distance / (air_time/60)) %>%
  group_by(tailnum) %>%
  summarise(avg_mph = mean(mph, na.rm=T)) %>%
  arrange(desc(avg_mph))

################################################################################

# Q6 - Which place has the most planes landing?

flights %>%
  filter(year == 2013) %>%
  group_by(dest) %>%
  summarize(flight_times = n()) %>%
  select(Destination = dest, flight_times) %>%
  arrange(desc(flight_times))

################################################################################





