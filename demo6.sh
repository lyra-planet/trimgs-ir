#!/bin/bash

# Log file to store output
LOG_FILE="process_log.txt"

# Run first Python script (train.py)
echo "Running train.py..." | tee -a $LOG_FILE
python train.py \
  -m outputs/demo6-garden/ \
  -s datasets/nerf_real_360/garden/ \
  --iterations 30000 \
  -i images_4 \
  -r 1 \
  --eval \
  --gamma | tee -a $LOG_FILE

# Run second Python script (baking.py)
echo "Running baking.py..." | tee -a $LOG_FILE
python baking.py \
  -m outputs/demo6-garden/ \
  --checkpoint outputs/demo6-garden/chkpnt30000.pth \
  --bound 16.0 \
  --occlu_res 64 \
  --occlusion 0.4 | tee -a $LOG_FILE

# Run third Python script (train.py again with different options)
echo "Running train.py again..." | tee -a $LOG_FILE
python train.py \
  -m outputs/demo6-garden/ \
  -s datasets/nerf_real_360/garden/ \
  --start_checkpoint outputs/demo6-garden/chkpnt30000.pth \
  --iterations 40000 \
  --pbr_iteration 30000 \
  -i images_4 \
  -r 1 \
  --eval \
  --metallic \
  --indirect \
  --gamma | tee -a $LOG_FILE

# Run fourth Python script (render.py)
echo "Running render.py..." | tee -a $LOG_FILE
python render.py \
  -m outputs/demo6-garden/ \
  -s datasets/nerf_real_360/garden/ \
  --checkpoint outputs/demo6-garden/chkpnt40000.pth \
  -i images_4 \
  -r 1 \
  --eval \
  --skip_train \
  --pbr \
  --metallic \
  --indirect \
  --gamma | tee -a $LOG_FILE


echo "Process completed." | tee -a $LOG_FILE
