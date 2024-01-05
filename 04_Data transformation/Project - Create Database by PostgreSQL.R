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

## Write a new table
customers <- tribble(
  ~customer_id, ~firstname, ~lastname, ~phone_num, ~gender, ~job, ~address_id,
  1, "Toy", "Datarockie", "0988888888", "M", "Data Analyst", "10110", 
  2, "Alfred", "Evans", "0908781220", "M", "Data Scientist", "10600", 
  3, "Nelly", "Franklin", "0671881399", "F", "Investment Banking", "10510", 
  4, "Bredford", "Fowler", "0919229038", "M", "Financial Advisor", "10510", 
  5, "Marry", "Smith", "0817899878", "F", "Fund Manager", "10400"
)
customers

menus <- tribble(
  ~menu_id, ~name, ~type, ~price,
  "M01", "Pepperoni", "Pizza", 249.0,
  "M02", "Hawaiian", "Pizza", 199.0,
  "M03", "BBQ Chicken", "Pizza", 199.0,
  "M04", "Seafood Island", "Pizza", 249.0,
  "M05", "Vegetarian", "Pizza", 199.0,
  "M06", "Extreme Cheese", "Pizza", 249.0,
  "M07", "MEAT Lover", "Pizza", 249.0,
  "M08", "Bacon and Ham", "Pizza", 249.0,
  "M09", "Caesar Salad", "Salad", 149.0,
  "M10", "Garden Salad with Salad Cream", "Salad", 129.0,
  "M11", "Spaghetti Carbonara", "Pasta", 139.0,
  "M12", "Pork Bolognese" ,"Pasta", 139.0,
  "M13", "Baked Macaroni & Cheese with Bacon", "Pasta", 139.0,
  "M14", "Coke", "Drink", 30.0,
  "M15", "Sprite", "Drink", 30.0
)
menus

orders <- tribble(
  ~order_id, ~menu_id, ~quantity, ~order_date, ~customer_id,
  "0001", "M01", 2, "2023-09-01", 1,
  "0001", "M02", 1, "2023-09-01", 1,
  "0002", "M05", 1, "2023-09-10", 2,
  "0002", "M06", 1, "2023-09-10", 2,
  "0003", "M03", 3, "2023-09-17", 5,
  "0004", "M04", 1, "2023-09-30", 3,
  "0004", "M07", 1, "2023-09-30", 3,
  "0004", "M08", 1, "2023-09-30", 3,
  "0005", "M08", 1, "2023-10-05", 4,
  "0005", "M05", 1, "2023-10-05", 4,
  "0006", "M01", 2, "2023-10-05", 2,
  "0006", "M06", 2, "2023-10-05", 2,
  "0007", "M03", 1, "2023-10-10", 5,
  "0008", "M04", 1, "2023-10-10", 3,
  "0008", "M07", 1, "2023-10-10", 3
)
orders

dbWriteTable(con, "customers", customers)
dbWriteTable(con, "menus", menus)
dbWriteTable(con, "orders", orders)
dbListTables(con)

################################################################################

## get data
customers <- dbGetQuery(con, "select * from customers")
customers

menus <- dbGetQuery(con, "select * from menus")
menus

orders <- dbGetQuery(con, "select * from orders")
orders

################################################################################

## close connection
dbDisconnect(con)

################################################################################

