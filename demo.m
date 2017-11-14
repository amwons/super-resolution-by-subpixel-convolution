%% ��ʼ��

clc;
clear;
addpath('./src')

%% ��������ͼ��

im = imread('./img/100080.jpg');
im = im(201:340, 101:240, 1);
[H, W, ~] = size(im);
input = reshape(im, 1, 1, H, W);

%% run

tic
upscale_factor = 5;
model_name = ['./model/model_upscale_', num2str(upscale_factor),'.mat'];
im_sr = SR_model(input, model_name);
size(im_sr)
toc
%% ��ʾ

figure
[~,~,h_sr, w_sr] = size(im_sr);
imshow(reshape(im_sr, h_sr, w_sr), [])
figure
[~,~,h, w] = size(input);
imshow(reshape(input, h, w), [])
