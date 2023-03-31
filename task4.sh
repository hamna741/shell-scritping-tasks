#!/bin/bash


git_dir=/home/hamna/Desktop/myproject/repo2

commit_message="commit message sent through shell script"

cd $git_dir

git add .

git commit -m "$commit_message"

git push origin main
