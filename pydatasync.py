#!/usr/bin/env python3

import subprocess as sub
import os

# list of directories having git repository
gitdirs = [
"/home/codeman/mydata/git/bin-git",
"/home/codeman/mydata/git/configs-git",
"/home/codeman/mydata/git/mynotes-git",
"/home/codeman/mydata/git/research/misc-git",
"/home/codeman/mydata/git/research/meetings-git",
"/home/codeman/mydata/git/research/resources-git",
"/home/codeman/mydata/git/research/code/benchmarks-git",
"/home/codeman/mydata/git/research/code/cs618project-git",
"/home/codeman/mydata/git/research/writeups/mandar-report-git",
"/home/codeman/mydata/git/research/writeups/mywriteups-git",
"/home/codeman/mydata/git/research/writeups/research-notes-git",
"/home/codeman/mydata/git/research/writeups/cs618-project-report-git",
"/home/codeman/mydata/git/ws/gate-notes-git",
]

gitcommands = [
"""git add --all ;""",
"""git commit -m 'automated-update' ;""",
"""git fetch origin master ;""",
"""git merge -m "automated-merge" origin/master ;""",
"""git push origin master ;""",
]

def syncall():
    err = 0
    for dir in gitdirs:
        os.chdir(dir)
        print(os.linesep, "$>>> ", dir, os.linesep, sep="")
        for cmd in gitcommands:
            cp = sub.run(cmd, shell=True)
            err += cp.returncode



if __name__ == "__main__":
  err = syncall()
  if err:
      print(os.linesep, "*****FINISHED WITH ERRORS*****", os.linesep, sep="")


