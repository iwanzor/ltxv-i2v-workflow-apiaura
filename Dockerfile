# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# Could not resolve unknown_registry node CheckpointLoaderSimple - no aux_id provided, skipping
# Could not resolve unknown_registry node LTXVConditioning - no aux_id provided, skipping
# Could not resolve unknown_registry node STGGuiderNode - no aux_id provided, skipping
# Could not resolve unknown_registry node LTXVBaseSampler - no aux_id provided, skipping
# Could not resolve unknown_registry node VHS_VideoCombine - no aux_id provided, skipping

# download models into comfyui
RUN comfy model download --url https://huggingface.co/Lightricks/LTX-Video/resolve/main/ltx-video-2b-v0.9.5.safetensors --relative-path models/checkpoints --filename ltx-video-2b-v0.9.5.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
