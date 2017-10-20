# Centos R 笔记
 
## R安装路径

R_HOME_DIR=/usr/lib64/R


## For El6 or CentOS 6

su -c 'rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm'

sudo yum update
sudo yum install R

## 安装Rcpp

yum list -q R-\*
sudo yum install R-Rcpp.x86_64
sudo yum install R-Rcpp-devel.x86_64

sudo yum install openssl-devel 
sudo yum install libxml2-devel

## 环境变量
SCALA_HOME=/data/R/epel/scala-2.10.4
SPARK_HOME=/data/R/epel/spark-2.1.0-bin-hadoop2.6
SPARKLING_HOME=/data/R/epel/sparkling-water-2.1.0

## java环境
Make sure you have Java Development Kit installed and correctly registered in R. If in doubt, re-run "R CMD javareconf" as root.

```shell
# 重新配置R里面的java环境变量
R CMD javareconf
```

## 配置R公共library

更改 /usr/lib64/R/etc/Renviron

注释掉了原来的 R_LIBS_USER=${R_LIBS_USER-'~/R/x86_64-redhat-linux-gnu-library/3.3'}

改为了： R_LIBS_USER=${R_LIBS_USER-'/srv/R/library'}

