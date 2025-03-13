python train.py \
-m outputs/lego/ \
-s datasets/TensoIR/lego/ \
--iterations 8000 \
--eval

python baking.py \
-m outputs/lego/ \
--checkpoint outputs/lego/chkpnt3000.pth \
--bound 1.5 \
--occlu_res 16 \
--occlusion 0.25

python train.py \
-m outputs/lego/ \
-s datasets/TensoIR/lego/ \
--start_checkpoint outputs/lego/chkpnt3000.pth \
--iterations 4000 \
--eval \
--gamma \
--indirect

python render.py \
-m outputs/lego \
-s datasets/TensoIR/lego/ \
--checkpoint outputs/lego/chkpnt4000.pth \
--eval \
--skip_train \
--pbr \
--gamma \
--indirect

python normal_eval.py \
--gt_dir datasets/TensoIR/lego/ \
--output_dir outputs/lego/test/ours_None

python render.py \
-m outputs/lego \
-s datasets/TensoIR/lego/ \
--checkpoint outputs/lego/chkpnt4000.pth \
--eval \
--skip_train \
--brdf_eval

python relight.py \
-m outputs/lego \
-s datasets/TensoIR/lego/ \
--checkpoint outputs/lego/chkpnt4000.pth \
--hdri datasets/TensoIR/Environment_Maps/high_res_envmaps_2k/bridge.hdr \
--eval \
--gamma

python relight_eval.py \
--output_dir outputs/lego/test/ours_None/relight/ \
--gt_dir datasets/TensoIR/lego/

python shadow_map.py -m outputs/lego \
-s datasets/TensoIR/lego/ \
--checkpoint outputs/lego/chkpnt4000.pth \
--frames 480 \
--fps 60 \
--start 158 \
--end 184 \
--linear \
--loop