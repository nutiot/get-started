#!/bin/bash
THIS_DIR=$(dirname $(realpath ${BASH_SOURCE[0]}))
REPO_LIST_RV32=$THIS_DIR/mini_qemu_riscv32.txt
REPO_LIST_W800=$THIS_DIR/mini_hihope_w800.txt
REPO_LIST_ALL=mini_repo_all.txt

cat $REPO_LIST_RV32 $REPO_LIST_W800 | sort | uniq > $REPO_LIST_ALL

echo $THIS_DIR

num=1
total=`wc -l $REPO_LIST_ALL`

repo init -u git@gitee.com:openharmony/manifest.git -b refs/tags/OpenHarmony-v4.1-Release --no-repo-verify

echo "Pull git repos ..."
for i in `cat $REPO_LIST_ALL`; do
    echo "[$num/$total] Fetch $i ..."
    repo sync -c $i
    num=`expr $num + 1`
done

echo "Pull git-lfs objects ..."
repo forall -c 'git lfs pull'
