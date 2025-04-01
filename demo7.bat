python train.py \
-m outputs/demo5-garden/ \
-s datasets/nerf_real_360/garden/ \
--iterations 4000 \
-i images_4 \
-r 1 \
--eval

python baking.py \
-m outputs/demo5-garden/ \
--checkpoint outputs/demo5-garden/chkpnt4000.pth \
--bound 16.0 \
--occlu_res 32 \
--occlusion 0.4

python train.py \
-m outputs/demo5-garden/ \
-s datasets/nerf_real_360/garden/ \
--start_checkpoint outputs/demo5-garden/chkpnt4000.pth \
--iterations 5000 \
--pbr_iteration 4000 \
-i images_4 \
-r 1 \
--eval \
--metallic \
--indirect

python render.py \
-m outputs/demo5-garden/ \
-s datasets/nerf_real_360/garden/ \
--checkpoint outputs/demo5-garden/chkpnt5000.pth \
-i images_4 \
-r 1 \
--eval \
--skip_train \
--pbr \
--metallic \
--indirect



python light_move.py -m outputs/demo5-garden/ \
-s datasets/nerf_real_360/garden/ \
--checkpoint outputs/demo5-garden/chkpnt4000.pth \
--metallic \
--frames 240 \
--fps 15 \
--start 158 \
--end 184 \
--loop \
--linear



python relight.py \
-m outputs/demo5-garden/ \
-s datasets/nerf_real_360/garden/ \
--checkpoint outputs/demo5-garden/chkpnt10000.pth \
--hdri datasets/Environment_Maps/high_res_envmaps_1k/bridge.hdr \
--eval \
--gamma

