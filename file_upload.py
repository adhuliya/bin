#!/usr/bin/env python3
"""
A simple server to upload files to a fixed location.
"""

import bottle
import os

HOST = "0.0.0.0" # at all interfaces
PORT = 5053
SAVE_PATH = "/home/codeman/.itsoflife/local/tmp/public"

@bottle.route("/")
def index():
  return """
    <form action="/upload" method="post" enctype="multipart/form-data">
      Select file 1: <input type="file" name="upload1" /><br/>
      Select file 2: <input type="file" name="upload2" /><br/>
      Select file 3: <input type="file" name="upload3" /><br/>
      <input type="submit" value="Start upload" />
      <input type="reset" value="reset" />
    </form>
  """

@bottle.route('/upload', method='POST')
def do_upload():
  response = []
  upload1 = bottle.request.files.get('upload1')
  upload2 = bottle.request.files.get('upload2')
  upload3 = bottle.request.files.get('upload3')
  if upload1:
    try:
      name, ext = os.path.splitext(upload1.filename)
      upload1.save(SAVE_PATH) # appends upload.filename automatically
    except IOError as io:
      response.append(f"Error saving {upload1.filename}: {io}")

  if upload2:
    try:
      name, ext = os.path.splitext(upload2.filename)
      upload2.save(SAVE_PATH) # appends upload.filename automatically
    except IOError as io:
      response.append(f"Error saving {upload2.filename}: {io}")

  if upload3:
    try:
      name, ext = os.path.splitext(upload3.filename)
      upload3.save(SAVE_PATH) # appends upload.filename automatically
    except IOError as io:
      response.append(f"Error saving {upload3.filename}: {io}")

  if len(response) == 0:
    response.append("OK")
  response.append('<br /><a href="/">Back</a>')

  return '<br\>\n'.join(response)

bottle.run(host=HOST, port=PORT)


