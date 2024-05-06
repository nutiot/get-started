#!/bin/bash
REPO_LIST_HDR=mini_repo_hdr.txt
REPO_LIST_SRC=mini_repo_src.txt
REPO_LIST_ALL=mini_repo_all.txt

cat $REPO_LIST_HDR $REPO_LIST_SRC > $REPO_LIST_ALL

num=1
total=`wc -l $REPO_LIST_ALL`

for i in `cat $REPO_LIST_ALL`; do
    echo "[$num/$total] Fetch $i ..."
    repo sync -c $i
    num=`expr $num + 1`
done

echo "Pull git-lfs objects ..."
repo forall -c 'git lfs pull'
