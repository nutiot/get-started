#!/bin/bash
REPO_LIST_RV32=mini_repo_qemu_riscv32.txt
REPO_LIST_W800=mini_repo_hihope_w800.txt
REPO_LIST_ALL=mini_repo_all.txt

cat $REPO_LIST_RV32 $REPO_LIST_W800 | sort | uniq > $REPO_LIST_ALL

num=1
total=`wc -l $REPO_LIST_ALL`

repo init -u git@gitee.com:openharmony/manifest.git -b OpenHarmony-4.1-Release --no-repo-verify

echo "Pull git repos ..."
for i in `cat $REPO_LIST_ALL`; do
    echo "[$num/$total] Fetch $i ..."
    repo sync -c $i
    num=`expr $num + 1`
done

echo "Pull git-lfs objects ..."
repo forall -c 'git lfs pull'
