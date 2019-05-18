#!/usr/bin/env python3
"""
A simple server to upload files and save to a fixed location.
It takes one optional argument : port number.

Its only dependecy is: bottle
Install bottle as:
  sudo pip3 install bottle
and you are done.

Author: Anshuman Dhuliya (anshumandhuliya@gmail.com)
"""

import bottle
import os
import sys

HOST = "0.0.0.0" # serve on all interfaces
PORT = 5053
SAVE_PATH = os.getcwd()

if len(sys.argv) > 1:
  try:
    PORT = int(sys.argv[1])
  except:
    print("Error: Only one optional argument accepted: Port Number")
    exit(1)

@bottle.route("/")
def index():
  return """
  <!DOCTYPE html>
  <html lang="en_us">
  <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Upload Files</title>
  <style>
  .button1 {
      background-color: #4CAF50; /* Green */
      border: none; color: white; padding: 10px 20px; text-align: center;
      text-decoration: none; display: inline-block; font-size: 16px;
    }
  .button2 {
      background-color: #4C50AF; /* Blue */
      border: none; color: white; padding: 10px 20px; text-align: center;
      text-decoration: none; display: inline-block; font-size: 16px;
    }
  </style>

  </head>
  <body style="max-width:768px;margin:auto;">
  <h2>Upload Files (at most 3 at a time).</h2>
  <h4>Naming the files meaningfully will immensely help us in its identification.</h4>
    <form action="/upload" method="post" enctype="multipart/form-data">
      <input class="button2" type="file" name="upload1" required/> (required)<br/>
      <input class="button1" type="file" name="upload2" /><br/>
      <input class="button1" type="file" name="upload3" /><br/>
      <br/>
      <input class="button1" type="reset" value="Reset" />
      &nbsp; &nbsp; &nbsp;
      <input class="button1" type="submit" value="Start upload" />
    </form>
  </body>
  </html>
  """

@bottle.route('/upload', method='POST')
def do_upload():
  page = """
  <style>
  .center{{margin: auto; width: 40%; border: 3px solid green; padding: 10px;}}
  </style>
  <body style="text-align:center;">
  <br /> <br />
  <div class="center">
  {main_content}
  </div>
  """
  response = []
  upload1 = bottle.request.files.get('upload1')
  upload2 = bottle.request.files.get('upload2')
  upload3 = bottle.request.files.get('upload3')
  file_count = 0
  err_msg = "Error saving <br/><br/><code>{}</code><br/><br/> {}"
  if upload1:
    try:
      name, ext = os.path.splitext(upload1.filename)
      upload1.save(SAVE_PATH) # appends upload.filename automatically
      file_count += 1
    except IOError as io:
      response.append(err_msg.format(upload1.filename, io))

  if upload2:
    try:
      name, ext = os.path.splitext(upload2.filename)
      upload2.save(SAVE_PATH) # appends upload.filename automatically
      file_count += 1
    except IOError as io:
      response.append(err_msg.format(upload2.filename, io))

  if upload3:
    try:
      name, ext = os.path.splitext(upload3.filename)
      upload3.save(SAVE_PATH) # appends upload.filename automatically
      file_count += 1
    except IOError as io:
      response.append(err_msg.format(upload3.filename, io))

  if len(response) == 0:
    if file_count:
      response.append("Uploaded.")
    else:
      response.append("No Files Selected, hence not uploaded.")
  response.append('<br /><a href="/">Back</a>')

  return page.format(main_content='<br\>\n'.join(response))

#bottle.run(host=HOST, port=PORT, server='cgi')
bottle.run(server='cgi')


