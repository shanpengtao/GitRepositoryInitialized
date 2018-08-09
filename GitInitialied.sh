#!/bin/sh

echo "~~~~~~~~~~~~~~~~开始初始化~~~~~~~~~~~~~~~~"

#输入目录及git地址
read -p "请您输入工程的根目录的路径，如果根目录是当前路径请输入“.”，以回车结束:" path
read -p "输入git仓库地址（最好用HTTPS方式）:" url 


#进入工程目录
cd $path
#初始化git
git init
#添加并提交文件到长裤
git add .
git commit -a -m "添加工程"
#关联远程仓库
git remote add origin $url
#拉取代码到本地仓库，忽略远程的README.md文件
git pull --rebase origin master
#本地代码push到远程仓库的master分支上 -u是由于第一次上传时远程仓库为空
git push -u origin master

echo "本地git仓库路径：$path, 远程git仓库地址：$url"
git status

echo "~~~~~~~~~~~~~~~~初始化git成功~~~~~~~~~~~~~~~~"