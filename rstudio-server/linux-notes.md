# notes about using Linux

## Linux 后台任务管理

1. & 命令加在最后，后台执行： `nohup bin/sparkling-shell --num-executors 3 --executor-memory 2g --master yarn-client > ./test.out &`
2. ctrl+z：将一个前台正在执行的命令放到后台，并且出于暂停状态
3. `jobs -l` 查看后台运行的任务； `ps -au`
4. `fg`后台命令调到前台：`fg $jobnum` jobnum是命令编号而不是pid
5. 杀死进程：`kill -9 pid` / `ctrl + c`


## Windows远程访问Linux terminal

1. Windows下载 [vnc viewer](https://www.realvnc.com/download/viewer/windows/)
2. Linux `sudo apt install vnc4server`

首先需要启动vncserver `$ vncserve` 生成桌面访问，例如 `psydata:1`. 第一次启动需要输入密码；

其次，修改生成的配置文件 `~/.vnc/xstartup`. 最后一行加入 `gnome-session &`;

最后，先中断，然后重启。`vncserver -kill :1` `vncserver :1 -alwaysshared`.

在Windows的界面打开vnc viewer 输入IP地址加桌面编号 `192.168.2.202:1`，输入密码就能登录到terminal了。

详细教程：<http://www.linuxidc.com/Linux/2012-10/73043.htm>

## Linux访问Windows局域网共享文件夹

下载samba    
sudo apt-get install samba samba-common sambaclient

创建一个文件夹并改变权限和用户组    
mkdir /srv/share
sudo chmod -R 777 /srv/share #让文件夹可写
sudo chown -R :rstdio-user /srv/share # 先设置好用户组

编辑配置文件，共享Linux文件夹
sudo vim /etc/samba/smb.conf

```shell
[rstudio-server] #共享文件夹的显示名称
	path = /srv/rstudio-server
	available = yes
	browseable = yes
	public = yes
	writable = yes
	guest ok = yes
````

编辑完成后，需要配置用户密码，还需要查看用户组sambashare的情况

touch smbpasswd    
sudo smbpasswd -a psydata #用户访问输入密码访问    
sudo smbpasswd -n psydata #用户psydata不需要密码访问    
sudo samba restart        #重启服务

然后就可以在Windows的文件管理界面访问了    
`\\192.168.2.202\rstudio-server`

如果Windows上面有共享的文件夹，在Linux下面可以通过    
`smb://192.168.2.201/linux-share` 访问


## 更新软件包

sudo apt-get update    
sudo apt-get upgrade    

## clean package cache

sudo apt-get autoclean    
sudo apt-get clean    
sudo apt-get autoremove #remove dependent packages

## remove installed package
sudo apt-get remove <packagename>    
sudo apt-get --purge remove <package> #删除所有配置信息

## input

fcitx -r #启动输入法

## 强制杀死进程

ps -ef/-aux #查看进程    
pgrep firefox #获取进程id    
kill -s <id> 

## 查看IP地址

- 通过菜单->网络->详情查看ipv4
- `ip route list`
- `ip address show`

## libreoffice 更新

sudo add-apt-repository ppa:libreoffice/ppa    
sudo apt-get update    
sudo apt-get dist-upgrade #更新所有包    
sudo apt-get install libreoffice libreoffice-l10nzh-cn libreoffice-help-zh-cn    

## 搜索特定的安装的包

dpkg -l|grep "google-chrome"    
dpkg -l|grep google-chrome


## 查看系统信息

uname -a    
lsb_realse -a    
cat /proc/version    
ip route

# 提升权限
sudo groupadd docker    
sudo usermod -aG docker psydata     

sudo groupadd rstudio-user    
sudo usermod -aG rstudio-user user1 #将user1加到rstudio-user用户组中
sudo usermod -aG rstudio-user user2

sudo useradd -d /home/user -g rstudio-usesr
sudo passwd user # 更改userd 密码


# 提升Rstudio共享文件夹的权限
chmod -R 777 /srv # -R 将整个目录包括子文件权限都设置为rwxrwxrwx
chown :rstudio-user /srv # 整个组改变所属
chown psydata /srv # psydata 替代 root

# 清理缓存
sudo apt-get autoclean    
sudo apt-get clean    
sudo apt-get autoremove

# 部署rstudio-server
sudo apt-get install libapparmor1 libcurl4-openssl-dev libssl1.0.0 libedit2 lsb-release psmisc python-setuptools    
sudo ln -s /usr/lib/rstudio-server/bin/pandoc/ /usr/local/bin    
sudo ln -s /usr/lib/rstudio-server/bin/pandoc/pandoc-citeproc /usr/local/bin/    
wget https://github.com/jgm/pandoc-templates/archive/1.19.2.1.tar.gz    
sudo mkdir -p /opt/pandoc/templates && tar zxf 1.19.2.1.tar.gz    
sudo cp -r pandoc-templates-1.19.2.1/* /opt/pandoc/templates/    
sudo mkdir /root/.pandoc    
sudo ln -s /opt/pandoc/templates/ /root/.pandoc/tempates

sudo echo '\n\
    \n# Configure httr to perform out-of-band authentication if HTTR_LOCALHOST \
    \n# is not set since a redirect to localhost may not work depending upon \
    \n# where this Docker container is running. \
    \nif(is.na(Sys.getenv("HTTR_LOCALHOST", unset=NA))) { \
    \n  options(httr_oob_default = TRUE) \
    \n}' >> /etc/R/Rprofile.site \
  && echo "PATH=\"/usr/lib/rstudio-server/bin/:\${PATH}\"" >> /etc/R/Renviron.site

sudo useradd rstudio 
sudo echo "rstudio:rstudio" | chpasswd 
sudo mkdir /home/rstudio
sudo chown rstudio:rstudio /home/rstudio
sudo addgroup rstudio staff


