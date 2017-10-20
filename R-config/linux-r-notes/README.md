# 大数据平台R相关配置

- [大数据平台R相关配置](#%E5%A4%A7%E6%95%B0%E6%8D%AE%E5%B9%B3%E5%8F%B0r%E7%9B%B8%E5%85%B3%E9%85%8D%E7%BD%AE)
    - [版本匹配](#%E7%89%88%E6%9C%AC%E5%8C%B9%E9%85%8D)
    - [安装下载](#%E5%AE%89%E8%A3%85%E4%B8%8B%E8%BD%BD)
        - [R及相应的环境](#r%E5%8F%8A%E7%9B%B8%E5%BA%94%E7%9A%84%E7%8E%AF%E5%A2%83)
        - [R源码编译](#r%E6%BA%90%E7%A0%81%E7%BC%96%E8%AF%91)
        - [配置R公共library](#%E9%85%8D%E7%BD%AEr%E5%85%AC%E5%85%B1library)
        - [RStudio Server](#rstudio-server)
        - [Spark](#spark)
        - [Sparkling Water](#sparkling-water)
    - [测试代码](#%E6%B5%8B%E8%AF%95%E4%BB%A3%E7%A0%81)


## 版本匹配

- CentOS/RedHeat
- R (>=3.4.1)
- RStudio Server(>= 1.1.383)
- java (>=1.7)
- spark (2.1.1)
- sparkling water(2.1.14)

## 安装下载

### R及相应的环境

```shell
## For El6 or CentOS 6

su -c 'rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm'

## for Centos 7
su -c 'rpm -Uvh https://mirrors.tuna.tsinghua.edu.cn/epel/7/x86_64/e/epel-release-7-10.noarch.rpm'
## 或者采用中科大镜像
#  https://mirrors.ustc.edu.cn/epel/7/x86_64/e/epel-release-7-10.noarch.rpm

sudo yum update
sudo yum install R

## 列出R的基础安装包
yum list -q R-\*

## 安装rjava和Rcpp
sudo yum install R-java.x86_64
sudo yum install R-java-devel.x86_64
sudo yum install R-Rcpp.x86_64
sudo yum install R-Rcpp-devel.x86_64

## 安装依赖库
sudo yum install openssl-devel 
sudo yum install libxml2-devel

## 如有必要重新配置R的java环境变量
R CMD javareconf

```

### R源码编译

```shell
# 1.安装编译器
sudo yum -y install gcc
sudo yum -y install gcc-c++
sudo yum -y install gcc-gfortran

# 2.许多R包依赖Java，需要配置Java的环境变量
JAVA_HOME=/usr/java/jdk1.7.0_67-cloudera
CLASSPATH=$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tool.jar:$CLASSPATH
PATH=$JAVA_HOME/bin:$PATH

# 3.安装R编译需要的依赖包
sudo yum -y install readline-devel
sudo yum -y install libXt-devel
sudo yum -y install bzip2-devel
sudo yum -y install xz-devel.x86_64
sudo yum -y install libcurl-devel
sudo yum -y install texinfo.x86_64 texlive-pdftex-doc.noarch tex texlive-scheme-basic
sudo yum -y install openssl-devel 
sudo yum -y install libxml2-devel

# 下载R源码
wget https://mirrors.tuna.tsinghua.edu.cn/CRAN/src/base/R-3/R-3.4.2.tar.gz
tar -zxvf R-3.4.2.tar.gz 
cd R-3.4.2
sudo ./configure --prefix=/usr/local/R-3.4.2 --enable-R-shlib
sudo make && make install

# 4.R环境变量配置

R_HOME=/usr/local/R-3.4.2
PATH=$R_HOME/bin:$PATH
source etc/profile
echo $R_HOME
R --version

```

### 配置R公共library

多个用户公用同一个R包库，避免重复下载浪费资源

**确保/srv/R/文件夹下具有全部读写权限`sudo chmod -R 777 /srv/R`**

更改 `etc/Renviron`

注释掉了原来的 `R_LIBS_USER=${R_LIBS_USER-'~/R/x86_64-redhat-linux-gnu-library/3.3'}`

改为了： `R_LIBS_USER=${R_LIBS_USER-'/srv/R/library'}`


### RStudio Server

下载说明 <https://www.rstudio.com/products/rstudio/download-server/>

```shell
# 64bit
$ wget https://download2.rstudio.org/rstudio-server-rhel-1.1.383-x86_64.rpm
$ sudo yum install --nogpgcheck rstudio-server-rhel-1.1.383-x86_64.rpm
```

RStudio server 配置文档参考 <https://github.com/BruceZhaoR/myconfig/blob/master/rstudio-server/rstudio-server-notes.md>

```shell
# rstudio-server notes

## 配置文件在 /etc/rstudio
## 帮助文档: https://support.rstudio.com/hc/en-us/articles/200552306-Getting-Started

## 启动服务
sudo rstudio-server verify-installation
sudo rstudio-server restart
sudo rstudio-server stop
sudo rstudio-server start

## 查看
sudo rstudio-server active-sessions
sudo rstudio-server suspend-session <pid> # 挂起
sudo rstudio-server suspend-all
sudo rstudio-server force-suspend-all
sudo rstudio-server kill-all              #强制结束
sudo rstudio-server kill-session <pid>

sudo rstudio-server offline               #下线维护
sudo rstudio-server online

# 在菜单->系统管理->用户和组
#点击添加+ -> 用户名，设定密码
# 管理组-> 找到rstudio-user ->点击属性-> 勾选新添加的用户名
# 重启 rstudio-server 生效

#命令行操作
sudo mkdir /home/test
sudo useradd -d /home/test -g rstudio-user test
sudo passwd test
sudo chown test:rstudio-user /home/test

sudo ln -s /srv/rstudio-server/ /home/test/ #与user共享
sudo chmod -R 777 /home/test/
sudo chmod -R a+wrx /home/test/ # 或者这样

sudo restart rstudio-server

# 其他命令
sudo userdel test 	#删除用户名
sudo groupadd 新用户组
sudo groupdel 用户组名  #删除组名
sudo usermod -aG rstudio-user test # 将test用户加入到rstudio-user组中
```

### Spark

<http://spark.apache.org/downloads.html>

spark（2.1.1）有条件使用spark（2.1.2),并增加`SPARK_HOME`环境变量

```R
# Windows local 模式下需要配置
Sys.setenv(SPARK_HOME = "E:\\spark\\spark-2.1.2-bin-hadoop2.7")
Sys.setenv(HADOOP_HOME = "E:\\spark\\spark-2.1.2-bin-hadoop2.7\\tmp\\hadoop")

sparklyr:::prepare_windows_environment(Sys.getenv("SPARK_HOME"))
```

### Sparkling Water

<http://h2o-release.s3.amazonaws.com/sparkling-water/rel-2.1/14/index.html>

下载对应版本的 sparkling water 和 h2o，放在用户可读写的文件夹下.

<http://h2o-release.s3.amazonaws.com/h2o/rel-weierstrass/2/R/src/contrib/h2o_3.14.0.2.tar.gz>

<http://h2o-release.s3.amazonaws.com/sparkling-water/rel-2.1/14/index.html>


```
R CMD INSTALL h2o_3.14.0.2.tar.gz
```

## 测试代码

```r
Sys.setenv(SPARK_HOME = "/home/Rstudio/spark-2.1.1-bin-hadoop2.7")
options(rsparkling.sparklingwater.version = "2.1.14")
options(rsparkling.sparklingwater.location = "/home/Rstudio/sparkling-water-2.1.14/assembly/build/libs/sparkling-water-assembly_2.11-2.1.14-all.jar")

library(dplyr)
library(sparklyr)
library(h2o)
library(rsparkling)

myconf <- list(
  "sparklyr.shell.driver-memory"= "4g",
  "sparklyr.shell.num-executors" = 3,
  "sparklyr.shell.executor-memory" = "5g",
  "sparklyr.shell.executor-cores" = 2
)

# connecting to spark
sc <- spark_connect(master="yarn-client",
                    version = "2.1.1", 
                    config = myconf)

# connecting to sparkling water
h2o_context(sc)
h2o_flow(sc)

# View the status of h2o cloud
h2o.clusterInfo()
h2o.clusterStatus()

# disconnect spark
spark_disconnect(sc)
```
