#!/bin/bash

# list of directories having git repository
# You can access them using echo "${arr[0]}", "${arr[1]}" also
declare -a arr=(
"/home/codeman/mydata/git/bin-git"
"/home/codeman/mydata/git/configs-git"
"/home/codeman/mydata/git/mynotes-git"
"/home/codeman/mydata/git/research/misc-git"
"/home/codeman/mydata/git/research/meetings-git"
"/home/codeman/mydata/git/research/resources-git"
"/home/codeman/mydata/git/research/code/benchmarks-git"
"/home/codeman/mydata/git/research/code/cs618project-git"
"/home/codeman/mydata/git/research/writeups/mandar-report-git"
"/home/codeman/mydata/git/research/writeups/mywriteups-git"
"/home/codeman/mydata/git/research/writeups/research-notes-git"
"/home/codeman/mydata/git/research/writeups/cs618-project-report-git"
"/home/codeman/mydata/git/ws/gate-notes-git"
)

## now loop through the above array
for DIR in "${arr[@]}"
do
    cd $DIR
    echo -e "\n$>>> $DIR\n"
    git add --all ;
    git commit -m 'automated-update' ;
    git fetch origin master ;
    git merge -m "automated-merge" origin/master ;
    git push origin master ;
done


