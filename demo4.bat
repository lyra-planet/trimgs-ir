python train.py \
-m outputs/demo2-garden/ \
-s datasets/nerf_real_360/garden/ \
--iterations 4000 \
-i images_4 \
-r 1 \
--eval \
--metallic \
--indirect \
--gamma


python baking.py \
-m outputs/demo2-garden/ \
--checkpoint outputs/demo2-garden/chkpnt8000.pth \
--bound 16.0 \
--occlu_res 64 \
--occlusion 0.4

python train.py \
-m outputs/demo2-garden/ \
-s datasets/nerf_real_360/garden/ \
--start_checkpoint outputs/demo2-garden/chkpnt8000.pth \
--iterations 9000 \
--pbr_iteration 8000 \
-i images_4 \
-r 1 \
--eval \
--metallic \
--indirect \
--gamma

python render.py \
-m outputs/demo2-garden/ \
-s datasets/nerf_real_360/garden/ \
--checkpoint outputs/demo2-garden/chkpnt10000.pth \
-i images_4 \
-r 1 \
--eval \
--skip_train \
--pbr \
--metallic \
--indirect \
--gamma

python light_move.py -m outputs/demo2-garden/ \
-s datasets/nerf_real_360/garden/ \
--checkpoint outputs/demo2-garden/chkpnt9000.pth \
--metallic \
--frames 240 \
--fps 15 \
--start 158 \
--end 184 \
--loop \
--linear



python relight.py \
-m outputs/demo2-garden/ \
-s datasets/nerf_real_360/garden/ \
--checkpoint outputs/demo2-garden/chkpnt10000.pth \
--hdri datasets/Environment_Maps/high_res_envmaps_1k/bridge.hdr \
--eval \
--gamma

# Stay point light and move camera
python shadow_map.py -m outputs/demo2-garden/ \
-s datasets/nerf_real_360/garden/ \
--checkpoint outputs/demo2-garden/chkpnt310000.pth \
--frames 480 \
--fps 60 \
--start 158 \
--end 184 \
--linear \
--loop

# Stay camera and move point light
