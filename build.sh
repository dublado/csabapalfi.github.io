#!/bin/bash

URL="https://api.github.com/search/repositories?q=user:csabapalfi+topic:blogpost"

POSTS=$(curl -s $URL | jq -r '.items[].name')

for POST in $POSTS
do
    (
      rm -rf $POST
      hub clone csabapalfi/$POST
      cd $POST || exit
      rm -rf .git
      github-markdown-html build
    ) &
done
wait

github-markdown-html build
