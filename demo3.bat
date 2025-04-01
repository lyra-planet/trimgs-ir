python train.py \
-m outputs/demo3-garden/ \
-s datasets/nerf_real_360/garden/ \
--iterations 2000 \
-i images_4 \
-r 1 \
--eval \
--gamma

python baking.py \
-m outputs/demo3-garden/ \
--checkpoint outputs/demo3-garden/chkpnt2000.pth \
--bound 16.0 \
--occlu_res 16 \
--occlusion 0.4

python train.py \
-m outputs/demo3-garden/ \
-s datasets/nerf_real_360/garden/ \
--start_checkpoint outputs/demo3-garden/chkpnt2000.pth \
--iterations 3000 \
--pbr_iteration 2000 \
-i images_4 \
-r 1 \
--eval \
--metallic \
--indirect \
--gamma

python render.py \
-m outputs/demo3-garden/ \
-s datasets/nerf_real_360/garden/ \
--checkpoint outputs/demo3-garden/chkpnt3000.pth \
-i images_4 \
-r 1 \
--eval \
--skip_train \
--pbr \
--metallic \
--indirect \
--gamma



python light_move.py -m outputs/demo3-garden/ \
-s datasets/nerf_real_360/garden/ \
--checkpoint outputs/demo3-garden/chkpnt3000.pth \
--metallic \
--frames 240 \
--fps 15 \
--start 158 \
--end 184 \
--loop \
--linear



python relight.py \
-m outputs/demo3-garden/ \
-s datasets/nerf_real_360/garden/ \
--checkpoint outputs/demo3-garden/chkpnt10000.pth \
--hdri datasets/Environment_Maps/high_res_envmaps_1k/bridge.hdr \
--eval \
--gamma

