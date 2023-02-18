import pandas as pd
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.chrome.service import Service

import numpy as np


def scrape_all_parkrun_results(athlete_number):

  option= webdriver.ChromeOptions()

  service = Service(r"C:\Users\hillarym\Documents\chromedriver\chromedriver.exe")

  browser = webdriver.Chrome(service = service, chrome_options=option)
  
  url = f"https://www.parkrun.org.uk/parkrunner/{athlete_number}/all/"
  print(url)

  browser.get(url)
  a = browser.page_source
  
  soup = BeautifulSoup(a,"html.parser")
  
  soup.contents
  
  tables = soup.findAll("table")
  table = tables[2]
  
  rows = table.findAll("tr")
  text_data = []
  mala_data = np.zeros((1,7))
  
  for tr in rows:
      cols = tr.findAll("td")
      for td in cols:
          row_text = td.get_text()
          text_data.append(row_text.strip())
          
  labels = ["event", "run_date", "run_number", "pos", "time", "age_grade", "pb"]
  myarray = np.asarray(text_data)
  data = myarray.reshape(-1,7)
    
  df = pd.DataFrame(data, columns = labels)

  browser.close()

  return(df)


# results.to_csv(f"results_{athlete}.csv", encoding = 'utf-8')
