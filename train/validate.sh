!/usr/bin/bash

dir_name=./dataset/BSDS300/images/validation/
for img in `ls $dir_name`;
do
python3 super_resolve.py --input_image dataset/BSDS300/images/test/$img --model model_upscale_7_epoch_101.pth --output_filename ${img}_upscale_7.png --cuda
done
