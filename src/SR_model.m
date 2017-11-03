function [ image_sr ] = SR_model( image, model_name)
%{ 
一、函数概述
    SR_model, 该函数以单波段图像作为输入，使用卷积神经网络做超分辨处理，输
出超分辨后的图像。不同的超分辨因子对应不同的预训练模型，超分辨因子可指定
2-10中的任意整数,指定超分辨因子时，手动指定不同的权重即可。权重命名具有一
定规律，如 model_upscale_7.mat，表示超分辨因子为7时对应的模型。
    该函数使用高效的子像素卷积层进行图像超分辨[1], 在GPU加速条件下能够实现
720P视频实时超分辨，相比于之前的深度学习模型，推理速度得到了极大提高。

二、参数说明：
  image ：4维数组，（N, 1, H, W）,N 为图像数量
  model : 预训练的权值
  image_sr ：4维数组，超分辨后的图像序列， 
  尺寸为：（N, 1, H * upscale_factor, W * upscale_factor）
  其中 N 为图像数量

三、参考文献：
[1] Shi W, Caballero J, Huszar F, et al. Real-Time Single Image and 
    Video Super-Resolution Using an Efficient Sub-Pixel Convolutional 
    Neural Network[J]. 2016:1874-1883.
%}

load(model_name)
out1 = conv_func(image, conv1_w);
out1 = relu(out1 + conv1_b);

out2 = conv_func(out1, conv2_w);
out2 = relu(out2 + conv2_b);

out3 = conv_func(out2, conv3_w);
out3 = relu(out3 + conv3_b);

out4 = conv_func(out3, conv4_w);
out4 = out4 + conv4_b;

image_sr = PixelShuffle( out4, 2 );

end

