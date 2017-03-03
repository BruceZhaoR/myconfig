# MySQL权限设置问题

Ubuntu 16.04 mysql 5.7
找到 /etc/mysql/mysql.conf.d/
以管理员权限打开 mysqld.cnf 
将 'bind-address = 127.0.0.1' 注释掉#
加上 `skip-external-locking` 和 `skip-name-resolve`

mysql -u root -p
GRANT ALL PRIVILEGES ON *.* TO root@'ip' IDENTIFIED BY 'Psy!' WITH GRANT OPTIONS; #'%'所有ip
flush privileges;

