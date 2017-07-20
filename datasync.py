#!/usr/bin/env python3

import subprocess as sub
import os
import os.path as osp
import sys


myData = os.environ["MYDATA"] or "/home/codeman/mydata"
repoRootDir = myData + "/git"
repoListFile = repoRootDir + "/configs-git/mydata-data/repositories.pylist"

usageMsg = """Usage: datasync [<groupName> [, <groupName> [...]]

groupName: only sync repos in 'group_name', default is 'all' live repos.

"""

def filterByGroup(repos, groups=["all"]):
    """
    Filters out all repoInfos from repos, not belonging to the given groups.
    """
    filtered = []
    for repo in repos:
        for repoGroup in repo["groups"]:
            if repoGroup in groups:
                filtered.append(repo)

    return filtered


def filterDeadRepos(repos):
    """
    Filters out all the 'dead' repoInfos from repos.
    """
    filtered = []
    for repo in repos:
        if repo["live"]:
            filtered.append(repo)

    return filtered


def filterByPath(repos, pathSubString=None):
    """
    Filters out repoInfos from repos, which have the 'pathSubString' in their
    directory path.
    Possible future use.
    """
    if pathSubString is None:
        return repos

    filtered = []
    for repo in repos:
        if pathSubString in repo["dir"]:
            filtered.append(repo)

    return filtered


def readRepoConfigFile(filename=repoListFile):
    """ read the repoInfos from the given file """
    repos = []
    with open(filename) as f:
        content = f.read()
        if content.strip():
            repos = eval(content)

    return repos


def getRepoDirs(repos=None):
    repoDirs = []
    if not repos:
        repos = readRepoConfigFile()
        repos = filterDeadRepos(repos)

    for repo in repos:
        repoDirs.append(osp.join(repoRootDir, repo["dir"]))

    return repoDirs


def syncAll(repoDirs):
    errDirs = []
    tmpErr = 0

    for dirpath in repoDirs:
        tmpErr = 0
        cp = None
        print(os.linesep, "$>>> ", dirpath, os.linesep, sep="")

        try:
            os.chdir(dirpath)
        except FileNotFoundError as e:
            print("DIRECTORY NOT FOUND", file=sys.stderr)
            print(os.linesep, "ERROR!!", file=sys.stderr, sep="")
            # tmpErr = 1
            errDirs.append(dirpath)
            continue

        if dirpath.endswith("-git"):
            cp = sub.run("gitsync", shell=True)
        else:
            # read only repo : discard local changes
            cp = sub.run("gitrosync", shell=True)

        if cp.returncode == 0:
            print("SUCCESS")
        else:
            errDirs.append(dirpath)
            print("ERROR!!", cp.returncode, file=sys.stderr)

    return errDirs


def scanGroups(argv):
    groups = []
    if len(argv) == 1:
        groups = ["all"] # sync all dirs in repoDirs
    else:
        groups = [g.strip().lower() for g in sys.argv[1:]]

    return groups


if __name__ == "__main__":

    repos = filterDeadRepos(readRepoConfigFile())

    groups = scanGroups(sys.argv)

    repos = filterByGroup(repos, groups)

    if not repos:
        print("NO REPOS MATCH SELECTION. EXITING")
        exit(1)

    repoDirs = getRepoDirs(repos)
    errDirs = syncAll(repoDirs)
    if errDirs:
        print("Error Dirs:", os.linesep, errDirs, file=sys.stderr)
        print(os.linesep, "{} ERRORS".format(len(errDirs)), os.linesep, sep="", file=sys.stderr)
    else:
        print(os.linesep, "SUCCESS. :)", os.linesep, sep="")


