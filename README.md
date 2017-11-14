 ## 该项目做了三件事

#### 1. 基于PyTorch训练了一系列单图像超分辨神经网络，超分辨系数从2-10。
该部分的实现参考了pytorch官方repo中的SR例程，训练程序包含于`./train`文件夹。该项目
基于高效子像素卷积层[1]进行空间分辨率提升操作，训练速度极快。

[1] ["Shi W, Caballero J, Huszar F, et al. Real-Time Single Image and
    Video Super-Resolution Using an Efficient Sub-Pixel Convolutional
    Neural Network[J]. 2016:1874-1883.](https://arxiv.org/abs/1609.05158)


#### 2. 把训练好的模型权值转存为MATLAB文件。
简单粗暴，异常直接
```python
from __future__ import print_function

import torch
import numpy as np
import scipy.io as sio

for i in [2, 3, 4, 5, 6, 7, 8, 9, 10]:

    model_name = 'model_upscale_{}_epoch_101.pth'.format(i)
    model = torch.load(model_name)
    print(model._modules)

    weight = dict()
    weight['conv1_w'] = model._modules['conv1']._parameters['weight'].data.cpu().numpy()
    weight['conv2_w'] = model._modules['conv2']._parameters['weight'].data.cpu().numpy()
    weight['conv3_w'] = model._modules['conv3']._parameters['weight'].data.cpu().numpy()
    weight['conv4_w'] = model._modules['conv4']._parameters['weight'].data.cpu().numpy()

    weight['conv1_b'] = model._modules['conv1']._parameters['bias'].data.cpu().numpy()
    weight['conv2_b'] = model._modules['conv2']._parameters['bias'].data.cpu().numpy()
    weight['conv3_b'] = model._modules['conv3']._parameters['bias'].data.cpu().numpy()
    weight['conv4_b'] = model._modules['conv4']._parameters['bias'].data.cpu().numpy()

    sio.savemat('model_upscale_{}.mat'.format(i), mdict=weight)
```

#### 3. 把网络的test过程移植到了MATLAB平台，并撰写了测试代码。
模型权值已保存为matlab权值，直接在matlab中运行`demo.m`文件即可验证
