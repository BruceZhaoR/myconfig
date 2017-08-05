# windows config keras


`win + R -> cmd `

```shell
conda create --name r-tensorflow python=3.6
activate r-tensorflow
conda install pandas scipy libprotobuf
# python35把36改成35
pip install --upgrade https://storage.googleapis.com/tensorflow/windows/cpu/tensorflow-1.2.1-cp36-cp36m-win_amd64.whl
pip install keras
```

- 镜像加速方法： [use_conda.md](./use_conda.md)
- 官方安装教程：<https://www.tensorflow.org/install/install_windows>
- GitHub安装包说明： <https://github.com/tensorflow/tensorflow#installation>
