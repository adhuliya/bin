#!/usr/bin/env python3
# pip3 install requests

"""
This script keeps the connection alive by sending
a GET request periodically.
"""

import requests
import time
from datetime import datetime
import threading

URL = "https://www.google.com"
SLEEP_TIME = 60 * 2
MAX_THREADS = 20

def sendRequest():
  now = datetime.now()
  try:
    r = requests.get(url = URL)
    if r.ok:
      print(f"{now}: OK")
    else:
      print(f"{now}: NOT_OK")
  except:
    print(f"{now}: ERROR")

while True:
  thread = threading.Thread(target=sendRequest)
  thread.start()
  # limit the number of threads
  while threading.activeCount() >= MAX_THREADS:
    now = datetime.now()
    print(f"{now}: MAX_THREADS = {MAX_THREADS}")
    time.sleep(5)
    continue
  time.sleep(SLEEP_TIME)

