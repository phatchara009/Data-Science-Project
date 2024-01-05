# install.packages("RPostgreSQL")
## connect to PostgreSQL server
library(RPostgreSQL)
library(tidyverse)

################################################################################

## create connection
con <- dbConnect(
  PostgreSQL(),
  host = "floppy.db.elephantsql.com",
  dbname = "zkbwxmnh",
  user = "zkbwxmnh",
  password = "7YddtLt0HTCq_5nrySKKkVvc1uSGmTHd",
  port = 5432
)
con

################################################################################

## db List Tables
dbListTables(con)

## create dataframe 
products <- tribble(
  ~id, ~product_name,
  1, "chocolate",
  2, "pineapple",
  3, "samsung galaxy S23"
)
products

dbWriteTable(con, "products", products)
dbListTables(con)

################################################################################

## get data
df <- dbGetQuery(con, "select id, product_name from products")
df

## HW02 - restaurant pizza SQL
## create 3-5 dataframes => write table into server

################################################################################

## remove table
dbRemoveTable(con, "products")
dbListTables(con)

################################################################################

## close connection
dbDisconnect(con)

################################################################################

