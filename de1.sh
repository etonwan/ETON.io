#更新
apt-get update && apt-get -y upgrade
#安装ehco
apt install ehco
#安装git
apt install git
#安装docker
curl -fsSL https://get.docker.com | bash -s docker
#安装docker-compose
ehco y | apt install docker-compose
#解决docker-compose报错
sudo apt-get install apparmor
service docker restart
#新建soga挂载文件夹
cd /etc
mkdir soga
cd /etc/soga
#初始化本地git仓库
git init
#关联远程仓库
git remote add -f origin https://github.com/etonwan/ETON.io.git
#sparsecheckout
git config core.sparsecheckout true
echo "/de1" >> .git/info/sparse-checkout
#拉取
git pull origin main
#拉出到上一级
cd /etc/soga/de1
mv ./* ../
rm -rf /etc/soga/de1
#启动soga
cd /etc/soga
docker-compose up -d
