## 使用conda在Windows上配置Python环境

### 1.安装

去官网下载对应的anaconda(3.6-64bit)安装包。如果电脑储存空间有限，建议下载Miniconda。miniconda只会安装conda和基础Python包，像pandas和scikit-learn这些后面用到的话，直接一行命名安装`conda install pandas scikit-learn` 默认安装到当前环境，这个后面再详细记录说明。

#### 1.1 配置包的下载镜像网点

有用的命令: 

```shell

conda --version/-V
conda info
conda config --show
```

采用清华大学的Anaconda的镜像： <https://mirrors.tuna.tsinghua.edu.cn/help/anaconda/>

```shell
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/msys2/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/
conda config --add channels r
conda config --set show_channel_urls yes
```

**注意：** 输完上面命令后，还需要到用户路径下找到`~/.condarc`文件，用`#`注释掉channels下面的`- defaults`

#### 1.2 配置pip加速镜像

可以把pip的下载方式pypi的镜像换成tuan的或者ustc的，参考对应的镜像网站上面的help。

1. 中科大: <https://lug.ustc.edu.cn/wiki/mirrors/help/pypi>
2. 清华: <https://mirrors.tuna.tsinghua.edu.cn/help/pypi/> (推荐)

Win10 创建: `~\AppData\Roaming\pip\pip.ini` 内容如下：

```shell
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
format = columns
```

### 2.更新与下载包

```shell
conda --help
conda update conda # 更新coda版本
conda list
conda install pandas
conda install scikit-learn
conda install jupyter #  下载jupyter notebook
```
更多命令请见conda cheetsheet

### 3.不同环境的配置

既然有jupyter这样的神器，还不赶紧把R kernel和py27的kernel配置起来。

#### R配置方法

R配置方法请见：

1. <https://github.com/IRkernel/IRkernel>
2. <https://irkernel.github.io>

注意：在安装`IRkernel`包的时候用devtools安装不了，那么就去release下载tar.gz压缩包，然后转到相应文件目录下采用`R CMD INSTALL IRkernel-0.8.6.tar.gz`的方式安装。

> in R 3.4  IRkernel::installspec(name = "ir34", displayname = "R-3.4") 

配置完后，kernel会放在这里：`C:\Users\Bruce\AppData\Roaming\jupyter\kernels`。可以去对应地方修改json的配置文件。    
`user = FALSE` 全局安装，安装文件在 `C:\ProgramData\jupyter\kernels`.

#### Python27配置方法

```shell
# 创建一个名为py27的Python 2.7环境，并在环境里面安装 ipykernel pandas scikit-learn等包。

conda create -n py27 python=2.7 ipykernel pandas scikit-learn 
source activate py27               # 激活环境
python -m ipykernel install --user --name myenv --display-name "root" # 配置kernel
```

```shell
conda info --env              # 查看环境情况
conda install -n py27 Cpython # 在py27环境中安装Cpython包
conda remove -n py27 -all     # 删除指定环境 
source activate/deactivate py27          # on windows remove the word 'source'
```

还可以通过 `jupyter qtconsole --kernel=ir34`来显示 R notebook


### 4.Reference

1. <https://zhuanlan.zhihu.com/p/25198543>
2. <https://ipython.readthedocs.io/en/latest/install/kernel_install.html>

