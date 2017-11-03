function [ image_sr ] = SR_model( image, model_name)
%{ 
һ����������
    SR_model, �ú����Ե�����ͼ����Ϊ���룬ʹ�þ�������������ֱ洦����
�����ֱ���ͼ�񡣲�ͬ�ĳ��ֱ����Ӷ�Ӧ��ͬ��Ԥѵ��ģ�ͣ����ֱ����ӿ�ָ��
2-10�е���������,ָ�����ֱ�����ʱ���ֶ�ָ����ͬ��Ȩ�ؼ��ɡ�Ȩ����������һ
�����ɣ��� model_upscale_7.mat����ʾ���ֱ�����Ϊ7ʱ��Ӧ��ģ�͡�
    �ú���ʹ�ø�Ч�������ؾ�������ͼ�񳬷ֱ�[1], ��GPU�����������ܹ�ʵ��
720P��Ƶʵʱ���ֱ棬�����֮ǰ�����ѧϰģ�ͣ������ٶȵõ��˼�����ߡ�

��������˵����
  image ��4ά���飬��N, 1, H, W��,N Ϊͼ������
  model : Ԥѵ����Ȩֵ
  image_sr ��4ά���飬���ֱ���ͼ�����У� 
  �ߴ�Ϊ����N, 1, H * upscale_factor, W * upscale_factor��
  ���� N Ϊͼ������

�����ο����ף�
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

