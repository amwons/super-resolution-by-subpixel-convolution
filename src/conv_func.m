function [ outputs ] = conv_func( inputs, kernels )
%	conv_func : 深度学习中的卷积层前向运算
%   with stride = 1 and padding = 'same'
%
%   input : N, C_in, H, W
%   kernel : C_out, C_in, kernel_h, kernel_w
%   output : N, C_out, H, W
inputs = double(inputs);
kernels = double(kernels);
[N, ~, H, W] = size(inputs);
[C_out, C_in, kernel_h, kernel_w] = size(kernels);

outputs = zeros(N, C_out, H, W);
tmp = zeros(C_in, H, W);

for i = 1:N
    for j = 1:C_out
        for k = 1:C_in
            input = reshape(inputs(i, k, :, :), H, W);
            kernel = reshape(kernels(j, k, :, :), kernel_h, kernel_w);
            tmp(k, :, :) = filter2(kernel, input, 'same'); % tmp (H, W)
            outputs(i, j, :, :) = sum(tmp, 1);
        end
    end
end

end

