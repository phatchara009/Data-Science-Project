
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
file_name = "olist_order_items_dataset.csv"
df = pd.read_csv(os.path.join(data_path, file_name), encoding="utf8")
df.dtypes


df.duplicated().sum()


df.drop_duplicates(inplace=True)


df.head()


# Convert "review_answer_timestamp" column to datetime type
df["shipping_limit_date"] = pd.to_datetime(df["shipping_limit_date"])


df = df.astype(object)
df.dtypes


# Convert NaN values to None
df = df.where(pd.notnull(df), None)
df.info()


df.nunique()


print(df.order_id.astype(str).str.len().max())
print(df.product_id.astype(str).str.len().max())
print(df.seller_id.astype(str).str.len().max())


# drop_table_query = """
#     DROP TABLE IF EXISTS order_items
# """

# create_table_query = """
#     CREATE TABLE order_items(    
#         order_id VARCHAR(50) NOT NULL,
#         order_item_id INT NOT NULL,
#         product_id VARCHAR(50) NOT NULL,
#         seller_id VARCHAR(50) NOT NULL,
#         shipping_limit_date DATETIME NULL,
#         price FLOAT NULL,
#         freight_value FLOAT NULL
#     );
# """

# with pyodbc.connect(conn_str) as con:
#     con.execute(drop_table_query)
#     con.execute(create_table_query)
#     con.commit()


# Define SQL command for truncate table
truncate_query = """
    TRUNCATE TABLE order_items
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
            INSERT INTO order_items
            VALUES (?, ?, ?, ?, ?, ?, ?)
        """
        # Execute command SQL for insert new data
        cursor.execute(insert_query, tuple(row))
    con.commit()


with pyodbc.connect(conn_str) as con:
    df_query = pd.read_sql("SELECT * FROM order_items", con)
    
df_query.info()


