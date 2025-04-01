python train.py \
-m outputs/demo9-bicycle/ \
-s datasets/nerf_real_360/bicycle/ \
--iterations 4000 \
-i images_4 \
-r 1 \
--eval

python baking.py \
-m outputs/demo9-bicycle/ \
--checkpoint outputs/demo9-bicycle/chkpnt4000.pth \
--bound 16.0 \
--occlu_res 32 \
--occlusion 0.4

python train.py \
-m outputs/demo9-bicycle/ \
-s datasets/nerf_real_360/bicycle/ \
--start_checkpoint outputs/demo9-bicycle/chkpnt4000.pth \
--iterations 5000 \
--pbr_iteration 4000 \
-i images_4 \
-r 1 \
--eval \
--metallic \
--indirect

python render.py \
-m outputs/demo9-bicycle/ \
-s datasets/nerf_real_360/bicycle/ \
--checkpoint outputs/demo9-bicycle/chkpnt5000.pth \
-i images_4 \
-r 1 \
--eval \
--skip_train \
--pbr \
--metallic \
--indirect



python light_move.py -m outputs/demo9-bicycle/ \
-s datasets/nerf_real_360/bicycle/ \
--checkpoint outputs/demo9-bicycle/chkpnt4000.pth \
--metallic \
--frames 240 \
--fps 15 \
--start 158 \
--end 184 \
--loop \
--linear



python relight.py \
-m outputs/demo9-bicycle/ \
-s datasets/nerf_real_360/bicycle/ \
--checkpoint outputs/demo9-bicycle/chkpnt10000.pth \
--hdri datasets/Environment_Maps/high_res_envmaps_1k/bridge.hdr \
--eval \
--gamma

