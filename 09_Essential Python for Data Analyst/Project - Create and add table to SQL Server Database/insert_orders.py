
# pip install pyodbc


import pandas as pd
import pyodbc
import os


# Define the parameters for connect to SQL Server database
driver_name = "ODBC Driver 17 for SQL Server"
server_name = "TIT-20230930FXD\\SQLEXPRESS"
database_name = "brazilian_ecommerce" # using database_name = "master" for create new database
trusted_connection = "yes"

# Define connection string
conn_str = f"DRIVER={driver_name};SERVER={server_name};DATABASE={database_name};Trusted_Connection={trusted_connection}"


# Read CSV file
data_path = r"C:\Users\Admin\Documents\GitHub\data-science-bootcamp9\09_Essential Python for Data Analyst\Project - Create and add table to SQL Server Database\data"
file_name = "olist_orders_dataset.csv"
df = pd.read_csv(os.path.join(data_path, file_name), encoding="utf8")
df.dtypes


df.duplicated().sum()


df.drop_duplicates(inplace=True)


df.head()


df["order_purchase_timestamp"] = pd.to_datetime(df["order_purchase_timestamp"])
df["order_approved_at"] = pd.to_datetime(df["order_approved_at"])
df["order_delivered_carrier_date"] = pd.to_datetime(df["order_delivered_carrier_date"])
df["order_delivered_customer_date"] = pd.to_datetime(df["order_delivered_customer_date"])
df["order_estimated_delivery_date"] = pd.to_datetime(df["order_estimated_delivery_date"])
df.dtypes


df = df.astype(object)
df.dtypes


# Convert NaN values to None
df = df.where(pd.notnull(df), None)
df.info()


df.nunique()


print(df.order_id.astype(str).str.len().max())
print(df.customer_id.astype(str).str.len().max())


drop_table_query = """
    DROP TABLE IF EXISTS orders
"""

create_table_query = """
    CREATE TABLE orders(    
        order_id VARCHAR(50) NOT NULL PRIMARY KEY,
        customer_id VARCHAR(50) NOT NULL,
        order_status VARCHAR(50) NULL,
        order_purchase_timestamp DATETIME NULL,
        order_approved_at DATETIME NULL,
        order_delivered_carrier_date DATETIME NULL,
        order_delivered_customer_date DATETIME NULL,
        order_estimated_delivery_date DATETIME NULL
    );
"""

with pyodbc.connect(conn_str) as con:
    con.execute(drop_table_query)
    con.execute(create_table_query)
    con.commit()


# Define SQL command for truncate table
truncate_query = """
    TRUNCATE TABLE orders
"""

# Execute command SQL for truncate table
with pyodbc.connect(conn_str) as con:
    cursor = con.cursor()
    cursor.execute(truncate_query)
    con.commit()


with pyodbc.connect(conn_str) as con:
    cursor = con.cursor()
    for index, row in df.iterrows():
        insert_query = """
            INSERT INTO orders
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        """
        # Execute command SQL for insert new data
        cursor.execute(insert_query, tuple(row))
    con.commit()


with pyodbc.connect(conn_str) as con:
    df_query = pd.read_sql("SELECT * FROM orders", con)
    
df_query.info()


