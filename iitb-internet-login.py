#!/usr/bin/env python3
# pip3 install requests

"""
This script logs into iitb website.
a GET request periodically.
"""

import requests
import getpass
from typing import Tuple

URL = "https://internet.iitb.ac.in"

def login(uid, passwd):
  params = {"uname":uid, "passwd":passwd}
  try:
    r = requests.post(URL, params)
    if r.ok:
      print(f"OK")
    else:
      print(f"NOT_OK")
  except:
    print("ERROR")

def userInput() -> Tuple[str, str]:
  uid = input("UserId: ")
  passwd = getpass.getpass(prompt="Password: ")
  return uid, passwd

def main():
  uid, passwd = userInput()
  login(uid, passwd)

if __name__ == "__main__":
  main()

