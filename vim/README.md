# Vim 配置文件 

### Windows配置文件

Windows  将`vimfiles`放在`~\vimfiles`，将`lua53.dll`放在`gvim.exe`同一个地方，一般在`echo $VIMRUNTIM`，也就是vim的安装路径

字体`Droid Sans Mono for Powerline`需要双击安装

1. `_vrimrc`为Windows配置文件，放在安装的根目录下面
2. 主题: 将colors文件夹里面的 dracula.vim移到`vim80/colors/`

**配置完成后，在vim运行`PlugInstall`即可完成插件下载**


**css hex 颜色高亮插件**

**Colorizer-0.10.vmb**
项目地址：https://github.com/chrisbra/Colorizer

用vim打开这个文件，然后输入`:so %`运行。更多设置信息请输入：`:h Colorizer`.

高亮：`:ColorHighlight`    
取消高亮： `:ColorClear`    
自定义颜色： `let g:colorizer_custom_colors = { 'white': '#fff'}`    

自动高亮,在_vimrc中写入下面命令：

```vim
:let g:colorizer_auto_color = 1
:let g:colorizer_auto_filetype='css,html'
:let g:colorizer_skip_comments = 1
```

### linux 配置文件

1. 配置文件在 /etc/vim/
2. 将vrimc替换过去



## 常用命令

**:set nobomb 去掉BOM**

### 保存/退出/查找

- :q! 放弃更改退出
- :wq 保存并退出
- :s/old/new/g 全行匹配替换 old->new
- :%s/old/new/gc 替换整个文件中的每一个匹配字符并提示

### 读取shell命令相关

- :!ls 执行外部命令
- :r <filename> /:r!ls 插入外部文件/命令结果 :r !date

### 复制粘贴类命令
`v` 进入选择模式，`hjkl`进行选择，`y`复制，`p`粘贴。

**`v` motion :operator**

- `dd` 剪切一行(前面加数字可以剪切n行)  `p` 粘贴
- `yy` 复制一行(前面加数字可以复制n行)  `p` 粘贴

r/R 替换光标后面的一个字符/多个字符

### 缩进与设置相关命令

- `>>` / `<<` 对当前行 向右/左缩进
- `=` 对齐缩进当前行
- `:pwd` `:ls` 
- `:Ve` 左变分屏浏览目录 `:Ve!`右边 `:He`下边
- `:set scb` 两个分屏的文件同步移动 `:set scb!`解开  scb=scrollbind
- `:set nohls`  设置命令 取消高亮
- `:set fileencoding` 查看文件编码

### 有用的命令
- `guu`/ `gUU` 一行全部变小/大写 可以在`v`模式下，选择后按 u/U。
- ctrl+ o/i 回到之前/较新位置
- ctrl + n/p 关键词补全
- `zr/R` `zm/M` 代码折叠打开 
- `:! start %` 在浏览器中运行html

### 窗口相关命令

- !mkdir dir 建立文件夹
- :e path/to/file 直接打开文件
- :vs path/to/file 垂直分割并打开文件
- :sp path/to/file 水平分割并打开文件
- :Vexplore 左边打开目录 :Ve ! 右边打开目录
- :He 水平打开目录列表

- :ls / :buffers 查看buffer缓冲区
- :bnext /:bn  下一个缓冲区 :bp 上一个buffer
- :b#  :b {buffer_name} / num 
- :bdelete {buffer_name} / num 删除buffer

- Ctrl+w+ _ / Ctrl+w+ | 最大高度
- Ctrl+w1+ _ / Ctrl+w1+ | 最小高度
- Ctrl+w+ = 相等
- Ctrl+w+c 关闭窗口 :close / :q / ZZ
- Ctrl+w+ hjkl 移动到
- Ctrl+w+ HJKL 移动窗口




当前日期: 2017/03/03 周五 
