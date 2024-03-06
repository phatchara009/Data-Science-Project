#!/usr/bin/env python
# coding: utf-8
import sys
import os
from selenium import webdriver
from selenium.webdriver.common.by import By
import time
import requests
from bs4 import BeautifulSoup
import pandas as pd

# Step 1: Initialize Chrome driver
chrome_driver_path = 'chromedriver.exe'
driver = webdriver.Chrome(chrome_driver_path)
driver.get('https://www.set.or.th/th/home')

time.sleep(10)

click_out = driver.find_element(By.XPATH, '/html/body/div[1]/div/div/div[3]/div/div[1]/button')
click_out.click()
time.sleep(2)

# Find the table using its XPath
table_element = driver.find_element(By.XPATH, '/html/body/div[1]/div/div/div[2]/div[1]/div[2]/div[2]/div/div[1]/div/div[2]/div[1]/div[1]/div[2]/div[1]/div/table[2]')

# Get the HTML content of the table
table_html = table_element.get_attribute('outerHTML')

# Parse the HTML content with BeautifulSoup
soup = BeautifulSoup(table_html, 'html.parser')

# Find all table rows including headers
table_rows = soup.find_all('tr')

# Extract table headers
table_headers = table_rows[0].find_all('th')
headers = [header.text.strip() for header in table_headers]

# Extract table data
table_data = []
for row in table_rows[1:]:
    row_data = [cell.text.strip() for cell in row.find_all('td')]
    table_data.append(row_data)

# Create DataFrame
df = pd.DataFrame(table_data, columns=headers)
print(df)

df

df.shape

df.dtypes

from datetime import datetime

df['Date'] = datetime.now().date()

df

df = df[['Date', 'ดัชนี',	'ล่าสุด',	'เปลี่ยนแปลง',	"ปริมาณ ('000 หุ้น)1",	"มูลค่า (ลบ.)1",]]

df

df.to_csv('test_2_result.csv', index=False)

import pyodbc

# กำหนดข้อมูลการเชื่อมต่อกับ SQL Server
server = 'DESKTOP-2GDDVLA'
database = 'new_db'
trusted_connection = 'yes'

# กำหนด connection string
conn_str = f'DRIVER=ODBC Driver 17 for SQL Server;SERVER={server};DATABASE={database};Trusted_Connection={trusted_connection}'

# สร้าง connection object
conn = pyodbc.connect(conn_str)

# อ่านข้อมูลจากไฟล์ CSV โดยใช้ pandas
df = pd.read_csv(r'C:\\Users\\USER\\Desktop\\New folder\\test_2_result.csv')

# สร้าง cursor object เพื่อ execute SQL
cursor = conn.cursor()

# กำหนดคำสั่ง SQL เพื่อ truncate ตาราง
truncate_query = '''
TRUNCATE TABLE Test_002
'''

# Execute คำสั่ง SQL เพื่อ truncate ตาราง
cursor.execute(truncate_query)

# เพิ่มข้อมูลจาก DataFrame เข้าไปในตาราง SQL
for index, row in df.iterrows():
    insert_query = '''
    INSERT INTO Test_002
    VALUES (?, ?, ?, ?, ?,?)
    '''
    # Execute คำสั่ง SQL เพื่อเพิ่มข้อมูล
    cursor.execute(insert_query, tuple(row))

# Commit การเปลี่ยนแปลง
conn.commit()

# ปิดการเชื่อมต่อ
conn.close()