**Put the file in the following location**

~/.jupyter/custom/custom.css


## gluon

jupyter notedown 插件,用于将markdown转换为jupyter notebook.


```shell
source activate r-tensorflow
jupyter notebook --generate-config
```

在`~/.jupyter/jupyter_notebook_config.py` 末尾加上

    c.NotebookApp.contents_manager_class = 'notedown.NotedownContentsManager'

## 服务器上运行jupyter

    ssh myserver -L 8008:localhost:8888

就可以在本地浏览器中打开`http://localhost:8008`
