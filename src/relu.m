function [ output ] = relu( input )
% �������е�ReLU�����
% ReLU(x) = max(x, 0)
input (input < 0) = 0;
output = input;

end

