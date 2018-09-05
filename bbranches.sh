#!/bin/bash
#
counter=1
MASTER_BRANCH=master
PR_MSG_SET="This is a test"

while [ $counter -le 55 ]; do
  #echo $counter
  DATE=$(date +"%Y%m%d%H%M%S%N")
  UNIQUE_BRANCH="zbcd$counter"
  echo $UNIQUE_BRANCH
  git checkout -b "$UNIQUE_BRANCH"
  touch "$UNIQUE_BRANCH"."$DATE"
  git add .
  git commit -m "$PR_MSG_SET"
  git push -u origin "$UNIQUE_BRANCH"
  git checkout "$MASTER_BRANCH"

  ((counter++))
done
