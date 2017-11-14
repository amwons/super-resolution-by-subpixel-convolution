from __future__ import print_function
import argparse
import torch
from torch.autograd import Variable
from PIL import Image
from torchvision.transforms import ToTensor
import scipy.io as sio

import numpy as np

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
    # print(model._modules['conv1']._parameters['weight'])
    # print(model._modules['conv1']._parameters['bias'])
    # print(model._modules['conv2']._parameters['weight'])
    # print(model._modules['conv2']._parameters['bias'])
    # print(model._modules['conv3']._parameters['weight'])
    # print(model._modules['conv3']._parameters['bias'])
    # print(model._modules['conv4']._parameters['weight'])
    # print(model._modules['conv4']._parameters['bias'])
