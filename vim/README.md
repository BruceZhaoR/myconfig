# 神的编辑器 —— Vim 

**个人配置文件: _vrimrc**

## css hex 颜色高亮插件

**Colorizer-0.10.vmb**
项目地址：https://github.com/chrisbra/Colorizer

用vim打开这个文件，然后输入`:so %`运行。更多设置信息请输入：`:h Colorizer`.

高亮：`:ColorHighlight`    
取消高亮： `:ColorClear`    
自定义颜色： `let g:colorizer_custom_colors = { 'white': '#fff'}`    

自动高亮,在_vimrc中写入下面命令：
```
:let g:colorizer_auto_color = 1
:let g:colorizer_auto_filetype='css,html'
:let g:colorizer_skip_comments = 1
```

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


当前日期: 2016/08/23 周二 

