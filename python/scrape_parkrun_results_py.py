# this script uses a chrome browser to scrape the All Results table in eg `https://www.parkrun.org.uk/parkrunner/4127516/all/`

import pandas as pd
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.chrome.service import Service

import numpy as np


def scrape_parkrun_results_py(athlete_number):

  option= webdriver.ChromeOptions()

  service = Service(r"C:\Users\hillarym\Documents\chromedriver\chromedriver.exe")

  browser = webdriver.Chrome(service = service, chrome_options=option)
  
  url = f"https://www.parkrun.org.uk/parkrunner/{athlete_number}/all/"
  print(url)

  browser.get(url)
  a = browser.page_source
  
  soup = BeautifulSoup(a,"html.parser")
  
  tables = soup.findAll("table")
  table = tables[2] # The third table is 'All Results' which has 7 columns (see labels below)
  
  rows = table.findAll("tr")
  text_data = []
  
  for tr in rows:
      cols = tr.findAll("td")
      for td in cols:
          row_text = td.get_text()
          text_data.append(row_text.strip())
          
  myarray = np.asarray(text_data)
  data = myarray.reshape(-1,7)
    
  labels = ["event", "run_date", "run_number", "pos", "time", "age_grade", "pb"]
  df = pd.DataFrame(data, columns = labels)

  browser.close()

  return(df)
