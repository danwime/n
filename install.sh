#/bin/bash

TMP=/tmp/n_install
GIT_URL=https://git.danwi.me/danwi/n.git

mkdir -p $TMP
echo "创建临时目录 ${TMP}"

cd $TMP

echo "开始克隆项目: ${GIT_URL}"
git clone $GIT_URL

echo "开始安装"
cd ./n
echo "确认目录存在: /usr/local/bin"
sudo mkdir -p /usr/local/bin

echo "删除原来的旧版本(如果有)"
sudo rm -f /usr/local/bin/n
sudo rm -f /usr/local/bin/dpm

echo "安装新版本"
sudo cp -f ./bin/n /usr/local/bin/n
sudo cp -f ./bin/dpm /usr/local/bin/dpm

echo "设定环境变量"
sudo echo "export NODE_PATH=/usr/local/lib/node_modules" > /etc/profile.d/node_path.sh
source /etc/profile.d/node_path.sh

rm -rf $TMP
echo "安装完成,删除临时目录"
