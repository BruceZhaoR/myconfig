## 使用conda在Windows上配置Python环境

### 安装

去官网下载对应的anaconda(3.6-64bit)安装包。如果电脑储存空间有限，建议下载Miniconda。miniconda只会安装conda和基础Python包，像pandas和scikit-learn这些后面用到的话，直接一行命名安装`conda install pandas scikit-learn` 默认安装到当前环境，这个后面再详细记录说明。

#### 配置包的下载镜像网点

有用的命令: 

```shell

conda --version/-v
conda info
conda config --show
```

采用清华大学的Anaconda的镜像：

```shell
conda config --add channels https://mirrors.tuan.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuan.tsinghua.edu.cn/anaconda/cloud/msys2/
conda config --add channels r
conda confit --set show_channe_urls yes
```

输完上面命令后，还需要到用户路径下找到`.condarc`文件，用`#`注释掉channels下面的`- defaults`

可以把pip的下载方式pypi的镜像换成tuan的或者ustc的，参考对应的镜像网站上面的help。

### 更新与下载包

```shell
conda update conda # 更新coda版本
conda list
conda install pandas
conda install scikit-learn
conda install jupyter #  下载jupyter notebook
```
更多命名请见conda cheetsheet

### 不同环境的配置

既然有jupyter这样的神器，还不赶紧把R kernel和py27的kernel配置起来。

#### R配置方法

R配置方法请见：<https://github.com/IRkernel/IRkernel> <https://irkernel.github.io>

注意：在安装`IRkernel`包的时候用devtools安装不了，那么就去release下载tar.gz压缩包，然后转到相应文件目录下采用`R CMD INSTALL IRkernel-0.8.6.tar.gz`的方式安装。

> in R 3.4  IRkernel::installspec(name = "ir34", displayname = "R 3.4") 

配置完后，kernel会放在这里：`C:\Users\Bruce\AppData\Roaming\jupyter\kernels`。可以去对应地方修改json的配置文件。

#### Python27配置方法

```shell
# 创建一个名为py27的Python 2.7环境，并在环境里面安装 ipykernel pandas scikit-learn等包。

conda create -n py27 python=2.7 ipykernel pandas scikit-learn 
source activate py27               # 激活环境
python -m ipykernel install --user # 配置kernel
```

```shell
conda info --env              # 查看环境情况
conda install -n py27 Cpython # 在py27环境中安装Cpython包
conda remove -n py27 -all     # 删除指定环境 
source activate/deactivate py27          # on windows remove the word 'source'
```

还可以通过 `jupyter qtconsole --kernel=ir34`来显示 R notebook


### Reference

1: <https://zhuanlan.zhihu.com/p/25198543>
2: <https://ipython.readthedocs.io/en/latest/install/kernel_install.html>

