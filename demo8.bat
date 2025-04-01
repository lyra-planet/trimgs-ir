python train.py \
-m outputs/demo8-garden/ \
-s datasets/nerf_real_360/garden/ \
--iterations 7000 \
-i images_4 \
-r 1 \
--eval

python baking.py \
-m outputs/demo8-garden/ \
--checkpoint outputs/demo8-garden/chkpnt7000.pth \
--bound 16.0 \
--occlu_res 64 \
--occlusion 0.4

python train.py \
-m outputs/demo8-garden/ \
-s datasets/nerf_real_360/garden/ \
--start_checkpoint outputs/demo8-garden/chkpnt7000.pth \
--iterations 8000 \
--pbr_iteration 7000 \
-i images_4 \
-r 1 \
--eval \
--metallic \
--indirect

python render.py \
-m outputs/demo8-garden/ \
-s datasets/nerf_real_360/garden/ \
--checkpoint outputs/demo8-garden/chkpnt8000.pth \
-i images_4 \
-r 1 \
--eval \
--skip_train \
--pbr \
--metallic \
--indirect



python light_move.py -m outputs/demo8-garden/ \
-s datasets/nerf_real_360/garden/ \
--checkpoint outputs/demo8-garden/chkpnt7000.pth \
--metallic \
--frames 240 \
--fps 15 \
--start 158 \
--end 184 \
--loop \
--linear



python relight.py \
-m outputs/demo8-garden/ \
-s datasets/nerf_real_360/garden/ \
--checkpoint outputs/demo8-garden/chkpnt10000.pth \
--hdri datasets/Environment_Maps/high_res_envmaps_1k/bridge.hdr \
--eval \
--gamma

