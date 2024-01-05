# Project - Data transformation with flights data

![Untitled](Project%20-%20Data%20transformation%20with%20flights%20data%2092e19c2f157f4ddf81bb83d501cc1b55/Untitled.png)

# Content

[Library for Data transformation with flights data](https://www.notion.so/Library-for-Data-transformation-with-flights-data-291ac4af48a34647b99c71830de4be8b?pvs=21) 

[Import flights data from nycflights13 package.](https://www.notion.so/Import-flights-data-from-nycflights13-package-d6b5c597ca46447d8c3775e27cc59451?pvs=21) 

[Flights data dictionary.](https://www.notion.so/Flights-data-dictionary-ef9e435828334f0f959e7b7da226ad79?pvs=21) 

[Q1 - Which airline is the most used and has the lowest departure and arrival delays?](https://www.notion.so/Q1-Which-airline-is-the-most-used-and-has-the-lowest-departure-and-arrival-delays-73c3cc16ad0e4816acfa5e4ec6d62cac?pvs=21) 

[Q2 - Which month has the most average departure and arrival delays?](https://www.notion.so/Q2-Which-month-has-the-most-average-departure-and-arrival-delays-ba238c43d0d942179558873e22263566?pvs=21) 

[Q3 - In 2013, which plane were the most heavily used?](https://www.notion.so/Q3-In-2013-which-plane-were-the-most-heavily-used-f898aa565d1b4cf2b16197232e1b2b02?pvs=21) 

[Q4 - Which plane were the most average departure delay?](https://www.notion.so/Q4-Which-plane-were-the-most-average-departure-delay-cd4d127c9cfe4b3d8b493f4b1d7c96cf?pvs=21) 

[Q5 - Which plane has good speed (distance per hours.)?](https://www.notion.so/Q5-Which-plane-has-good-speed-distance-per-hours-73ed2b7816b64fa09e07caf99fab3441?pvs=21) 

[Q6 - Which place has the most planes landing?](https://www.notion.so/Q6-Which-place-has-the-most-planes-landing-24b34170f19f4f1cb4128ed8ddf91b1c?pvs=21) 

# Library for Data transformation with flights data

1. nycflights13 — Airline on-time data for all flights departing NYC in 2013. Also includes useful 'metadata' on airlines, airports, weather, and planes.
2. tidyverse — Package for data science.
3. lubridate — Package for work with dates and times.

```r
library(nycflights13)
library(tidyverse)
library(lubridate)
```

# Import flights data from nycflights13 package.

- Main data
    
    ```r
    data("flights")
    ```
    
    ```
    # A tibble: 336,776 × 19
        year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time arr_delay
       <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>     <dbl>
     1  2013     1     1      517            515         2      830            819        11
     2  2013     1     1      533            529         4      850            830        20
     3  2013     1     1      542            540         2      923            850        33
     4  2013     1     1      544            545        -1     1004           1022       -18
     5  2013     1     1      554            600        -6      812            837       -25
     6  2013     1     1      554            558        -4      740            728        12
     7  2013     1     1      555            600        -5      913            854        19
     8  2013     1     1      557            600        -3      709            723       -14
     9  2013     1     1      557            600        -3      838            846        -8
    10  2013     1     1      558            600        -2      753            745         8
    # ℹ 336,766 more rows
    # ℹ 10 more variables: carrier <chr>, flight <int>, tailnum <chr>, origin <chr>,
    #   dest <chr>, air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>,
    #   time_hour <dttm>
    # ℹ Use `print(n = ...)` to see more rows
    ```
    
- Name of airlines
    
    ```r
    data("airlines")
    ```
    
    ```
    # A tibble: 16 × 2
       carrier name                       
       <chr>   <chr>                      
     1 9E      Endeavor Air Inc.          
     2 AA      American Airlines Inc.     
     3 AS      Alaska Airlines Inc.       
     4 B6      JetBlue Airways            
     5 DL      Delta Air Lines Inc.       
     6 EV      ExpressJet Airlines Inc.   
     7 F9      Frontier Airlines Inc.     
     8 FL      AirTran Airways Corporation
     9 HA      Hawaiian Airlines Inc.     
    10 MQ      Envoy Air                  
    11 OO      SkyWest Airlines Inc.      
    12 UA      United Air Lines Inc.      
    13 US      US Airways Inc.            
    14 VX      Virgin America             
    15 WN      Southwest Airlines Co.     
    16 YV      Mesa Airlines Inc.
    ```
    
- Detail of planes
    
    ```r
    data("planes")
    ```
    
    ```
    # A tibble: 3,322 × 9
       tailnum  year type                    manufacturer    model engines seats speed engine
       <chr>   <int> <chr>                   <chr>           <chr>   <int> <int> <int> <chr> 
     1 N10156   2004 Fixed wing multi engine EMBRAER         EMB-…       2    55    NA Turbo…
     2 N102UW   1998 Fixed wing multi engine AIRBUS INDUSTR… A320…       2   182    NA Turbo…
     3 N103US   1999 Fixed wing multi engine AIRBUS INDUSTR… A320…       2   182    NA Turbo…
     4 N104UW   1999 Fixed wing multi engine AIRBUS INDUSTR… A320…       2   182    NA Turbo…
     5 N10575   2002 Fixed wing multi engine EMBRAER         EMB-…       2    55    NA Turbo…
     6 N105UW   1999 Fixed wing multi engine AIRBUS INDUSTR… A320…       2   182    NA Turbo…
     7 N107US   1999 Fixed wing multi engine AIRBUS INDUSTR… A320…       2   182    NA Turbo…
     8 N108UW   1999 Fixed wing multi engine AIRBUS INDUSTR… A320…       2   182    NA Turbo…
     9 N109UW   1999 Fixed wing multi engine AIRBUS INDUSTR… A320…       2   182    NA Turbo…
    10 N110UW   1999 Fixed wing multi engine AIRBUS INDUSTR… A320…       2   182    NA Turbo…
    # ℹ 3,312 more rows
    # ℹ Use `print(n = ...)` to see more rows
    ```
    

# Flights data dictionary.

| Column names | Description |
| --- | --- |
| year, month, day | Date of departure. |
| dep_time, arr_time | Actual departure and arrival times (format HHMM or HMM), local tz. |
| sched_dep_time, sched_arr_time | Scheduled departure and arrival times (format HHMM or HMM), local tz. |
| dep_delay, arr_delay | Departure and arrival delays, in minutes. Negative times represent early departures/arrivals. |
| carrier | Two letter carrier abbreviation. See http://127.0.0.1:46305/help/library/nycflights13/help/airlines to get name. |
| flight | Flight number. |
| tailnum | Plane tail number. See http://127.0.0.1:46305/help/library/nycflights13/help/planes for additional metadata. |
| origin, dest | Origin and destination. See http://127.0.0.1:46305/help/library/nycflights13/help/airports for additional metadata. |
| air_time | Amount of time spent in the air, in minutes. |
| distance | Distance between airports, in miles. |
| hour, minute | Time of scheduled departure broken into hour and minutes. |
| time_hour | Scheduled date and hour of the flight as a POSIXct date. Along with origin, 
can be used to join flights data to weather data. |

# Q1 - Which airline is the most used and has the lowest departure and arrival delays?

```r
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
```

```
# A tibble: 10 × 4
   Airline                flight_times avg_dep_delay avg_arr_delay
   <chr>                         <int>         <dbl>         <dbl>
 1 United Air Lines Inc.         58665         12.1          3.56 
 2 JetBlue Airways               54635         13.0          9.46 
 3 Delta Air Lines Inc.          48110          9.26         1.64 
 4 American Airlines Inc.        32729          8.59         0.364
 5 Envoy Air                     26397         10.6         10.8  
 6 US Airways Inc.               20536          3.78         2.13 
 7 Virgin America                 5162         12.9          1.76 
 8 Alaska Airlines Inc.            714          5.80        -9.93 
 9 Hawaiian Airlines Inc.          342          4.90        -6.92 
10 SkyWest Airlines Inc.            32         12.6         11.9
```

# Q2 - Which month has the most average departure and arrival delays?

```r
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
```

```
Month avg_dep_delay avg_arr_delay
   <int>         <dbl>         <dbl>
 1     1         10.0          6.13 
 2     2         10.8          5.61 
 3     3         13.2          5.81 
 4     4         13.9          11.2  
 5     5         13.0          3.52 
 6     6         20.8          16.5  
 7     7         21.7          16.7  
 8     8         12.6          6.04 
 9     9         6.72         -4.02 
10    10         6.24         -0.167
11    11         5.44          0.461
12    12         16.6          14.9
```

# Q3 - In 2013, which plane were the most heavily used?

```r
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
```

```
# A tibble: 4,043 × 4
   tailnum tailnum_year sum_distance flights_times
   <chr>          <int>        <dbl>         <int>
 1 N328AA          1986       939101           393
 2 N338AA          1987       931183           388
 3 N327AA          1986       915665           387
 4 N335AA          1987       909696           385
 5 N323AA          1986       844529           357
 6 N319AA          1985       840510           354
 7 N336AA          1987       838086           353
 8 N329AA          1987       830776           344
 9 N324AA          1986       794895           328
10 N339AA          1988       786123           326
# ℹ 4,033 more rows
# ℹ Use `print(n = ...)` to see more rows
```

# Q4 - Which plane were the most average departure delay?

```r
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
```

```
# A tibble: 4,044 × 3
   tailnum tailnum_year avg_delay
   <chr>          <int>     <dbl>
 1 N844MH          2002       297
 2 N922EV          2003       274
 3 N587NW          2002       272
 4 N911DA          1995       268
 5 N851NW          2004       233
 6 N654UA          1992       227
 7 N928DN            NA       203
 8 N7715E          2005       186
 9 N665MQ            NA       177
10 N136DL          1991       165
# ℹ 4,034 more rows
# ℹ Use `print(n = ...)` to see more rows
```

# Q5 - Which plane has good speed (distance per hours.)?

```r
flights %>%
  mutate(mph = distance / (air_time/60)) %>%
  group_by(tailnum) %>%
  summarise(avg_mph = mean(mph, na.rm=T)) %>%
  arrange(desc(avg_mph))
```

```
# A tibble: 4,044 × 2
   tailnum avg_mph
   <chr>     <dbl>
 1 N228UA     501.
 2 N315AS     499.
 3 N654UA     499.
 4 N819AW     490.
 5 N382HA     486.
 6 N388HA     484.
 7 N391HA     484.
 8 N777UA     483.
 9 N385HA     483.
10 N392HA     482.
# ℹ 4,034 more rows
# ℹ Use `print(n = ...)` to see more rows
```

# Q6 - Which place has the most planes landing?

```r
flights %>%
  filter(year == 2013) %>%
  group_by(dest) %>%
  summarize(flight_times = n()) %>%
  select(Destination = dest, flight_times)
  arrange(desc(flight_times))
```

```
# A tibble: 105 × 2
   Destination flight_times
   <chr>              <int>
 1 ORD                17283
 2 ATL                17215
 3 LAX                16174
 4 BOS                15508
 5 MCO                14082
 6 CLT                14064
 7 SFO                13331
 8 FLL                12055
 9 MIA                11728
10 DCA                 9705
# ℹ 95 more rows
# ℹ Use `print(n = ...)` to see more rows
```