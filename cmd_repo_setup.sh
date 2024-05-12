#!/bin/bash

sudo apt install git curl python3 python3-pip

# 创建目录
mkdir ~/bin

# 下载repo脚本
curl https://gitee.com/oschina/repo/raw/fork_flow/repo-py3 > ~/bin/repo

# 下载repo依赖的软件包
pip3 install -i https://repo.huaweicloud.com/repository/pypi/simple requests

