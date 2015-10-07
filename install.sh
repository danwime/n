#/bin/bash

TMP=/tmp/n_install
GIT_URL=https://git.danwi.me/danwi/n.git

mkdir -p $TMP
echo "创建临时目录${TMP}"

cd $TMP

echo "开始克隆项目: ${GIT_URL}"
git clone $GIT_URL

echo "开始安装"
cd n
make install

rm -rf /tmp/n_install
echo "安装完成,删除临时目录"
