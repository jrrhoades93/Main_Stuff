#!/usr/bin/env python

'''
Created by Joshua Rhoades
'''
'''
This program is designed to scrape the home page of bleepingcomputer.
It will scrape the Latest Articles' text description and link to the article.
The goal for future progress would be to add email support.
'''

from selenium import webdriver
from BeautifulSoup import BeautifulSoup
import pandas as pd

driver = webdriver.Chrome("/usr/lib/chromium-browser/chromedriver")

articles=[] # Title for articles
desc=[] # Text for articles
links=[] # Links for articles

driver.get("https://www.bleepingcomputer.com/")
driver.maximize_window()

content = driver.page_source
soup = BeautifulSoup(content)



for link in soup.find_all('a'):
    print(link.get('href'))

'''
for i in range(20):
        soup.find('l',attrs='')

'''
