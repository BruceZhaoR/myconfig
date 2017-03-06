# 配置笔记

运行失败最主要的原因是用户权限的问题

## 配置文件

在 /etc/shiny-server/shiny-server.conf 里面修改用户名和端口号

默认的是 shiny 用户，所以我们需要给足shiny用户组的权限。

`sudo addgroup psydata shiny`;`sudo chown shiny.shiny /var/log/shiny-server`

## shiny apps自动运行的文件夹

在 /srv/shiny-server/ 文件夹下

## log文件夹

/var/log/shiny-server/ 文件夹下

## 控制命令

```shell
sudo systemctl start shiny-server
sudo systemctl stop shiny-server
sudo systemctl restart shiny-server

# reload configuration but keep server running
sudo systemctl kill -s HUP --kill-who=main shiny-server

# enable/disable whether run automatically at boot time
sudo systemctl enable shiny-server

````

