function [ outputs ] = PixelShuffle( inputs, upscale_factor )
%	PixelShuffle :
%
%   input : N, upscale_factor ** 2, H, W
%   output : N, 1, H*upscale_factor, W*upscale_factor

[N, ~, H, W] = size(inputs);
H_out = H*upscale_factor;
W_out = W*upscale_factor;
outputs = zeros([N, 1, H_out, W_out]);
for i = 1:N
    for h = 1: H_out
        for w = 1:W_out
            height_idx = floor(h / upscale_factor+0.5);
            weight_idx = floor(w / upscale_factor+0.5);
            channel_idx = (upscale_factor * mod(h-1, upscale_factor)) + mod(w-1, upscale_factor)+1;
            outputs(i, 1, h, w) = inputs(i, channel_idx, height_idx, weight_idx);
        end
    end
end
end

