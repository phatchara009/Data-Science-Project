# %%
# import os
# os.system("pip install  selenium")
# os.system("pip install  beautifulsoup4")
# os.system("pip install  requests")

# %%
import sys
import os
from selenium import webdriver
from selenium.webdriver.common.by import By
import time
import requests
from bs4 import BeautifulSoup
import pandas as pd

options = webdriver.ChromeOptions()
options.add_argument("--start-maximized")
driver = webdriver.Chrome(options)
driver.get('https://datawarehouse.dbd.go.th/index')
time.sleep(10)

click_out = driver.find_element(By.XPATH, '/html/body/div[5]/div/div/div/div[3]/button')
click_out.click()
time.sleep(3)

click_out_2 = driver.find_element(By.XPATH, '/html/body/div[7]/div/div/div/div[1]/div[2]/div[1]/button')
click_out_2.click()
time.sleep(3)

search = driver.find_element(By.XPATH, '/html/body/div[2]/div[2]/div/div/form/div/input')
search.send_keys(47732)
time.sleep(3)

click_button = driver.find_element(By.XPATH, '/html/body/div[2]/div[2]/div/div/form/div/span')
click_button.click()
time.sleep(10)

click_out_3 = driver.find_element(By.XPATH, '/html/body/div[2]/div[2]/div/div[2]/div[4]/ul/li/a')
click_out_3.click()
time.sleep(10)

click_out_4 = driver.find_element(By.XPATH, '/html/body/div[2]/div[2]/div/div[2]/div[2]/div[2]/div/table/tbody/tr/td[4]')
click_out_4.click()
time.sleep(24)

table_element = driver.find_element(By.XPATH, '/html/body/div[2]/div[2]/div/div[2]/div[1]/div[2]/div[2]/div[2]/div/div/div[2]/div/div/div/div')

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
df.head()

df.columns = ['no', 'co_id', "corporation_name", "total_revenue_baht"]
df.columns

df.drop(columns=['no'], inplace=True)

# Remove commas and convert to integer
df['total_revenue_baht'] = df['total_revenue_baht'].str.replace(',', '').astype(float)

df.dtypes

df.to_csv('top_5_jewellery_store.csv', index=False)


