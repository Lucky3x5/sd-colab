#!/bin/bash

#alias curl='curl -S -s'
#QUIET=' --quiet'

# Memory Fix
echo "Installing memory fix packages"
mkdir /content/tmp
cd /content/tmp
curl -Lo memfix.zip https://github.com/nolanaatama/sd-webui/raw/main/memfix.zip
unzip memfix.zip
apt install -qq libunwind8-dev
dpkg -i *.deb
cd /content
rm -rf /content/tmp

# FastAPI
echo "Installing FastAPI"
pip install --upgrade fastapi==0.90.1 $QUIET

# pyTorch
echo "Installing pyTorch and deps"
pip install torch==1.13.1+cu116 torchvision==0.14.1+cu116 torchaudio==0.13.1 torchtext==0.14.1 torchdata==0.5.1 --extra-index-url https://download.pytorch.org/whl/cu116 -U $QUIET

# Stable Diffusion WebUI
echo "Installing Stable Diffusion WebUI"
echo "    Installing Stable Diffusion WebUI Core"
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui $QUIET
echo "    Downgrading Stable Diffusion"
cd /content/stable-diffusion-webui
git checkout 0cc0ee1

echo '    Installing Stable Diffusion WebUI Tunnels extension'	
git clone https://github.com/nolanaatama/sd-webui-tunnels /content/stable-diffusion-webui/extensions/sd-webui-tunnels $QUIET
echo '    Installing Stable Diffusion WebUI ControlNet extension'	
git clone https://github.com/Mikubill/sd-webui-controlnet /content/stable-diffusion-webui/extensions/sd-webui-controlnet $QUIET
echo '    Installing Stable Diffusion WebUI OpenPose editor extension'	
git clone https://github.com/fkunn1326/openpose-editor /content/stable-diffusion-webui/extensions/openpose-editor $QUIET
echo '    Installing Stable Diffusion WebUI Image Browser extension'	
git clone https://github.com/yfszzx/stable-diffusion-webui-images-browser /content/stable-diffusion-webui/extensions/stable-diffusion-webui-images-browser $QUIET
echo '    Installing Stable Diffusion WebUI LoCon extension'
git clone https://github.com/KohakuBlueleaf/a1111-sd-webui-locon /content/stable-diffusion-webui/extensions/a1111-sd-webui-locon $QUIET
echo '    Installing Stable Diffusion WebUI LoRA block weight extension'
git clone https://github.com/hako-mikan/sd-webui-lora-block-weight /content/stable-diffusion-webui/extensions/sd-webui-lora-block-weight $QUIET
echo '    Installing Stable Diffusion WebUI HighRes Fix'
git clone https://github.com/Kahsolt/stable-diffusion-webui-hires-fix-progressive /content/stable-diffusion-webui/extensions/stable-diffusion-webui-hires-fix-progressive $QUIET

## Stable Diffusion Models
echo '    Installing Stable Diffusion Models'
echo "        Models: $SD_MODELS"
curl -Lo /content/stable-diffusion-webui/models/Stable-diffusion/chilloutmixni.safetensors https://huggingface.co/nolanaatama/chomni/resolve/main/chomni.safetensors
#curl -Lo /content/stable-diffusion-webui/models/Stable-diffusion/urpm13.ckpt https://huggingface.co/nolanaatama/urpm13/resolve/main/urpm13.ckpt
#curl -Lo /content/stable-diffusion-webui/models/Stable-diffusion/f222.safetensors https://huggingface.co/m4gnett/zeipher-f222/resolve/main/f222.safetensors
#curl -Lo /content/stable-diffusion-webui/models/Stable-diffusion/level4.safetensors https://huggingface.co/holaholax/level4_v50BakedVAEFp16/resolve/main/level4_v50BakedVAEFp16.safetensors

## ControlNet Models
echo '    Installing ControlNet Models'	
curl -Lo /content/stable-diffusion-webui/extensions/sd-webui-controlnet/models/control_canny.safetensors https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_canny-fp16.safetensors
curl -Lo /content/stable-diffusion-webui/extensions/sd-webui-controlnet/models/control_depth.safetensors https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_depth-fp16.safetensors
curl -Lo /content/stable-diffusion-webui/extensions/sd-webui-controlnet/models/control_hed-fp16.safetensors https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_hed-fp16.safetensors
curl -Lo /content/stable-diffusion-webui/extensions/sd-webui-controlnet/models/control_mlsd-fp16.safetensors https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_mlsd-fp16.safetensors
curl -Lo /content/stable-diffusion-webui/extensions/sd-webui-controlnet/models/control_normal-fp16.safetensors https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_normal-fp16.safetensors
curl -Lo /content/stable-diffusion-webui/extensions/sd-webui-controlnet/models/control_openpose-fp16.safetensors https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_openpose-fp16.safetensors
curl -Lo /content/stable-diffusion-webui/extensions/sd-webui-controlnet/models/control_scribble-fp16.safetensors https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_scribble-fp16.safetensors
curl -Lo /content/stable-diffusion-webui/extensions/sd-webui-controlnet/models/control_seg-fp16.safetensors https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_seg-fp16.safetensors
curl -Lo /content/stable-diffusion-webui/extensions/sd-webui-controlnet/models/t2iadapter_canny_sd14v1.pth https://huggingface.co/TencentARC/T2I-Adapter/resolve/main/models/t2iadapter_canny_sd14v1.pth
curl -Lo /content/stable-diffusion-webui/extensions/sd-webui-controlnet/models/t2iadapter_color_sd14v1.pth https://huggingface.co/TencentARC/T2I-Adapter/resolve/main/models/t2iadapter_color_sd14v1.pth
curl -Lo /content/stable-diffusion-webui/extensions/sd-webui-controlnet/models/t2iadapter_depth_sd14v1.pth https://huggingface.co/TencentARC/T2I-Adapter/resolve/main/models/t2iadapter_depth_sd14v1.pth
curl -Lo /content/stable-diffusion-webui/extensions/sd-webui-controlnet/models/t2iadapter_keypose_sd14v1.pth https://huggingface.co/TencentARC/T2I-Adapter/resolve/main/models/t2iadapter_keypose_sd14v1.pth
curl -Lo /content/stable-diffusion-webui/extensions/sd-webui-controlnet/models/t2iadapter_openpose_sd14v1.pth https://huggingface.co/TencentARC/T2I-Adapter/resolve/main/models/t2iadapter_openpose_sd14v1.pth
curl -Lo /content/stable-diffusion-webui/extensions/sd-webui-controlnet/models/t2iadapter_seg_sd14v1.pth https://huggingface.co/TencentARC/T2I-Adapter/resolve/main/models/t2iadapter_seg_sd14v1.pth
curl -Lo /content/stable-diffusion-webui/extensions/sd-webui-controlnet/models/t2iadapter_sketch_sd14v1.pth https://huggingface.co/TencentARC/T2I-Adapter/resolve/main/models/t2iadapter_sketch_sd14v1.pth
curl -Lo /content/stable-diffusion-webui/extensions/sd-webui-controlnet/models/t2iadapter_style_sd14v1.pth https://huggingface.co/TencentARC/T2I-Adapter/resolve/main/models/t2iadapter_style_sd14v1.pth

## LoRA
echo '    Installing Stable Diffusion LoRAs'
rm -rf /content/stable-diffusion-webui/models/Lora
cd /content/stable-diffusion-webui/models
git clone https://huggingface.co/Lucky555/Lora $QUIET

## Embeddings
echo '    Installing Stable Diffusion Embeddings'
rm -rf /content/stable-diffusion-webui/embeddings
cd /content/stable-diffusion-webui
git clone https://huggingface.co/Lucky555/embeddings $QUIET

## VAE
echo '    Installing Stable Diffusion VAEs'
rm -rf /content/stable-diffusion-webui/models/VAE
cd /content/stable-diffusion-webui/models
git clone https://huggingface.co/Lucky555/VAE $QUIET
cd /content/stable-diffusion-webui

## ESRGAN
echo '   Installing Stable Diffusion ESRGAN'
cd /content/stable-diffusion-webui/models
git clone https://huggingface.co/nolanaatama/ESRGAN $QUIET
echo "Installation completed"

# Web UI tunnel
echo 'Starting WebUI'
