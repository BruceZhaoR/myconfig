# windows config keras


`win + R -> cmd `

```shell
conda create --name r-tensorflow python=3.6
activate r-tensorflow
conda install pandas scipy libprotobuf future
pip install futures==3.1.1
pip install tensorflow==1.5.0
pip install keras
```

- 镜像加速方法： [use_conda.md](./use_conda.md)
- 官方安装教程：<https://www.tensorflow.org/install/install_windows>
- GitHub安装包说明： <https://github.com/tensorflow/tensorflow#installation>
- tensorflow 1.5.0 bug: <https://github.com/tensorflow/tensorflow/issues/16478>

