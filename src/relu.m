function [ output ] = relu( input )
% 神经网络中的ReLU激活函数
% ReLU(x) = max(x, 0)
input (input < 0) = 0;
output = input;

end

