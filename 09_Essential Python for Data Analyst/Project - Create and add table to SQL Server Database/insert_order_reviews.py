
# pip install pyodbc


import pandas as pd
import pyodbc
import os
from datetime import datetime


# Define the parameters for connect to SQL Server database
driver_name = "ODBC Driver 17 for SQL Server"
server_name = "TIT-20230930FXD\\SQLEXPRESS"
database_name = "brazilian_ecommerce" # using database_name = "master" for create new database
trusted_connection = "yes"

# Define connection string
conn_str = f"DRIVER={driver_name};SERVER={server_name};DATABASE={database_name};Trusted_Connection={trusted_connection}"


# Read CSV file
data_path = r"C:\Users\Admin\Documents\GitHub\data-science-bootcamp9\09_Essential Python for Data Analyst\Project - Create and add table to SQL Server Database\data"
file_name = "olist_order_reviews_dataset.csv"
df = pd.read_csv(os.path.join(data_path, file_name), encoding="utf8")
df.dtypes


df.duplicated().sum()


df.drop_duplicates(inplace=True)


df.head()


# Convert "review_answer_timestamp" column to datetime type
df["review_creation_date"] = pd.to_datetime(df["review_creation_date"])


# Convert "review_answer_timestamp" column to datetime type
df["review_answer_timestamp"] = pd.to_datetime(df["review_answer_timestamp"])


df = df.astype(object)
df.dtypes


# Convert NaN values to None
df = df.where(pd.notnull(df), None)
df.info()


df.nunique()


print(df.review_id.astype(str).str.len().max())
print(df.order_id.astype(str).str.len().max())
print(df.review_comment_title.astype(str).str.len().max())
print(df.review_comment_message.astype(str).str.len().max())


# drop_table_query = """
#     DROP TABLE IF EXISTS order_reviews
# """

# create_table_query = """
#     CREATE TABLE order_reviews(    
#         review_id VARCHAR(50) NOT NULL,
#         order_id VARCHAR(50) NOT NULL,
#         review_score INT NULL,
#         review_comment_title NVARCHAR(255) NULL,
#         review_comment_message NVARCHAR(255) NULL,
#         review_creation_date DATETIME NULL,
#         review_answer_timestamp DATETIME NULL
#     );
# """

# with pyodbc.connect(conn_str) as con:
#     con.execute(drop_table_query)
#     con.execute(create_table_query)
#     con.commit()


# Define SQL command for truncate table
truncate_query = """
    TRUNCATE TABLE order_reviews
"""

# Execute command SQL for truncate table
with pyodbc.connect(conn_str) as con:
    cursor = con.cursor()
    cursor.execute(truncate_query)
    con.commit()


# Convert review_score column to string
df["review_score"] = df["review_score"].astype(str)

with pyodbc.connect(conn_str) as con:
    cursor = con.cursor()
    for index, row in df.iterrows():
        insert_query = """
            INSERT INTO order_reviews
            VALUES (?, ?, ?, ?, ?, ?, ?)
        """
        # Execute command SQL for insert new data
        cursor.execute(insert_query, tuple(row))
    con.commit()


with pyodbc.connect(conn_str) as con:
    df_query = pd.read_sql("SELECT * FROM order_reviews", con)
    
df_query.info()


