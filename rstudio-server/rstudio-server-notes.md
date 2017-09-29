# rstudio-server notes
配置文件在 /etc/rstudio

帮助文档: <https://support.rstudio.com/hc/en-us/articles/200552306-Getting-Started>

```shell
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
```

## 增加账户
在菜单->系统管理->用户和组    
点击添加+ -> 用户名，设定密码    
管理组-> 找到rstudio-user ->点击属性-> 勾选新添加的用户名    
重启 rstudio-server 生效    

```shell
#命令行操作
sudo mkdir /home/user
sudo useradd -d /home/user -g rstudio-user user
sudo passwd 用户名
sudo chown user:rstudio-user /home/user
sudo ln -s /srv/rstudio-server/ /home/user/ #与user共享
sudo chmod -R 777 /home/user/
chmod -R a+wrx /home/user/ # 或者这样

sudo restart rstudio-server

sudo userdel 用户名 	#删除用户名
sudo groupdel 用户组名  #删除组名
sudo usermod -aG rstudio-user user
```

## 共享文件夹
sudo ln -s /srv/rstudio-server/ /home/psydata/ #与psydata用户共享
sudo ln -s /srv/rstudio-server/ /home/sophiazj/ #与Sophiazj共享

sudo chown -R :rstudio-server /srv # 改变用户组为rstudio-server
sudo chmod -R 777 /srv			   # 将/srv文件夹下所有文件变成读写权限

