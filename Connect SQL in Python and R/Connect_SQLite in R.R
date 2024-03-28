# install.packages("sqldf")
library(sqldf)

data("mtcars")

sqldf("select * from mtcars")

sqldf("select mpg, hp from mtcars
       where hp >= 200")

sqldf(
  "
  select 
    am,
    avg(hp), 
    max(hp),
    count(*) 
  from mtcars
  group by am
  "
)

################################################################################

## connect SQLite database

# install.packages("RSQLite")
library(RSQLite)
library(tidyverse)

## connect to sqlite.db file
con <- dbConnect(SQLite(), "data/chinook.db")
con

## list tables
dbListTables(con)

## list fields/ columns
dbListFields(con, "customers")

## get data from database tables
dbGetQuery(con, "select CustomerID, FirstName from customers")

m1 <- dbGetQuery(con, "select firstname, email from customers
                 where country = 'USA' ")
view(m1)

################################################################################
  
## create dataframe 
products <- tribble(
  ~id, ~product_name,
  1, "chocolate",
  2, "pineapple",
  3, "samsung galaxy S23"
)
products

## write table to database
dbWriteTable(con, "products", products)

dbListTables(con)

################################################################################

## remove table
dbRemoveTable(con, "products")
dbListTables(con)

################################################################################


## close connection
dbDisconnect(con)


################################################################################






