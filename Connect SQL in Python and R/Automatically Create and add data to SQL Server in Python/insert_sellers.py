
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
data_path = r"C:\Users\Admin\Documents\GitHub\data-science-bootcamp9\09_Essential Python for Data Analyst\Project - Automatically Create and add data to a SQL Server\data"
file_name = "olist_sellers_dataset.csv"
df = pd.read_csv(os.path.join(data_path, file_name), encoding="utf8")
df.info()


df.duplicated().sum()


df.drop_duplicates(inplace=True)


df.head()


df = df.astype(object)
df.dtypes


# Convert NaN values to None
df = df.where(pd.notnull(df), None)
df.info()


df.nunique()


print(df.seller_id.astype(str).str.len().max())
print(df.seller_zip_code_prefix.astype(str).str.len().max())
print(df.seller_city.astype(str).str.len().max())
print(df.seller_state.astype(str).str.len().max())


# drop_table_query = """
#     DROP TABLE IF EXISTS sellers
# """

# create_table_query = """
#     CREATE TABLE sellers(    
#         seller_id VARCHAR(50) NOT NULL PRIMARY KEY,
#         seller_zip_code_prefix VARCHAR(50) NULL,
#         seller_city VARCHAR(50) NULL,
#         seller_state VARCHAR(50) NULL,
#     );
# """

# with pyodbc.connect(conn_str) as con:
#     con.execute(drop_table_query)
#     con.execute(create_table_query)
#     con.commit()


# Define SQL command for truncate table
truncate_query = """
    TRUNCATE TABLE sellers
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
            INSERT INTO sellers
            VALUES (?, ?, ?, ?)
        """
        # Execute command SQL for insert new data
        cursor.execute(insert_query, tuple(row))
    con.commit()


with pyodbc.connect(conn_str) as con:
    df_query = pd.read_sql("SELECT * FROM sellers", con)
    
df_query.info()


