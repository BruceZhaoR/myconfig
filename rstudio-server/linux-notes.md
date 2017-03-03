# 查看基本信息
cat /proc/version
uname -a
ip route

# 提升权限
sudo groupadd docker
sudo usermod -aG docker psydata 

sudo groupadd rstudio-user
sudo usermod -aG rstudio-user user1
sudo usermod -aG rstudio-user user2

sudo useradd rstudio
sudo addgroup rstudio staff

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


