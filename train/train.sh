!/usr/bin/bash

for i in 2 3 4 5 6 7 8 9 10;
do
python3 main.py --upscale_factor $i --batchSize 4 --testBatchSize 100 --nEpochs 100 --lr 0.001
done
