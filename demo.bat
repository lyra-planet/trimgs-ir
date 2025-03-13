python train.py \
-m outputs/bicycle/ \
-s datasets/nerf_real_360/bicycle/ \
--iterations 8000 \
-i images_4 \
-r 1 \
--eval

python baking.py \
-m outputs/bicycle/ \
--checkpoint outputs/bicycle/chkpnt3000.pth \
--bound 16.0 \
--occlu_res 64 \
--occlusion 0.1

python train.py \
-m outputs/bicycle \
-s datasets/nerf_real_360/bicycle/ \
--start_checkpoint outputs/bicycle/chkpnt3000.pth \
--iterations 4000 \
-i images_4 \
-r 1 \
--eval \
--metallic \
--indirect

python render.py \
-m outputs/bicycle \
-s datasets/nerf_real_360/bicycle/ \
--checkpoint outputs/bicycle/chkpnt4000.pth \
-i images_4 \
-r 1 \
--eval \
--skip_train \
--pbr \
--metallic \
--indirect

python relight.py \
-m outputs/bicycle \
-s datasets/nerf_real_360/bicycle/ \
--checkpoint outputs/bicycle/chkpnt2000.pth \
--hdri datasets/Environment_Maps/high_res_envmaps_1k/bridge.hdr \
--eval \
--gamma

python shadow_map.py -m outputs/bicycle \
-s datasets/nerf_real_360/bicycle/ \
--checkpoint outputs/bicycle/chkpnt4000.pth \
--frames 480 \
--fps 60 \
--start 158 \
--end 184 \
--linear \
--loop


python light_move.py -m outputs/bicycle \
-s datasets/nerf_real_360/bicycle/ \
--checkpoint outputs/bicycle/chkpnt500.pth \
--frames 240 \
--fps 30 \
--start 158 \
--end 184 \
--loop --\
linear