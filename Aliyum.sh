#!/bin/bash
#关闭防火墙
systemctl stop firewalld
systemctl disable firewalld
echo “防火墙关闭完成”

#SELINUX
sed -ri 's/SELINUX=enforcing/SELINUX=disabled/'  /etc/selinux/config
cat  /etc/selinux/config |grep SELINUX=

#更换阿里yum源
mv /etc/yum.repos.d/*  /tmp/      #移走官方yum源到/tmp/下

curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo     #更换阿里Centos源

sed -i -e '/mirrors.cloud.aliyuncs.com/d' -e '/mirrors.aliyuncs.com/d' /etc/yum.repos.d/CentOS-Base.repo   

yum -y install wget

wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo

ls /etc/yum.repos.d

echo "更换阿里镜像成功！！！"
yum install -y vim 
