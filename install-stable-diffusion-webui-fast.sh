#!/bin/bash

INFO_COLOR='\033[1;34m'
NO_COLOR='\033[0m'

#alias curl='curl -S -s'
#QUIET=' --quiet'

cd /content

# Stable Diffusion WebUI
echo -e "${INFO_COLOR}Installing Stable Diffusion WebUI${NO_COLOR}"
echo -e "${INFO_COLOR}    Installing Stable Diffusion WebUI Core${NO_COLOR}"
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui $QUIET

echo -e "${INFO_COLOR}    Installing Stable Diffusion WebUI Tunnels extension${NO_COLOR}"
git clone https://github.com/nolanaatama/sd-webui-tunnels /content/stable-diffusion-webui/extensions/sd-webui-tunnels $QUIET
echo -e "${INFO_COLOR}    Installing Stable Diffusion WebUI ControlNet extension${NO_COLOR}"	
git clone https://github.com/Mikubill/sd-webui-controlnet /content/stable-diffusion-webui/extensions/sd-webui-controlnet $QUIET
echo -e "${INFO_COLOR}    Installing Stable Diffusion WebUI OpenPose editor extension${NO_COLOR}"
git clone https://github.com/fkunn1326/openpose-editor /content/stable-diffusion-webui/extensions/openpose-editor $QUIET
echo -e "${INFO_COLOR}    Installing Stable Diffusion WebUI Image Browser extension${NO_COLOR}"
git clone https://github.com/yfszzx/stable-diffusion-webui-images-browser /content/stable-diffusion-webui/extensions/stable-diffusion-webui-images-browser $QUIET
echo -e "${INFO_COLOR}    Installing Stable Diffusion WebUI LoCon extension${NO_COLOR}"
git clone https://github.com/KohakuBlueleaf/a1111-sd-webui-locon /content/stable-diffusion-webui/extensions/a1111-sd-webui-locon $QUIET
echo -e "${INFO_COLOR}    Installing Stable Diffusion WebUI LoRA block weight extension${NO_COLOR}"
git clone https://github.com/hako-mikan/sd-webui-lora-block-weight /content/stable-diffusion-webui/extensions/sd-webui-lora-block-weight $QUIET
echo -e "${INFO_COLOR}    Installing Stable Diffusion WebUI HighRes Fix extension${NO_COLOR}"
git clone https://github.com/Kahsolt/stable-diffusion-webui-hires-fix-progressive /content/stable-diffusion-webui/extensions/stable-diffusion-webui-hires-fix-progressive $QUIET

## Stable Diffusion Models
echo -e "${INFO_COLOR}    Installing Stable Diffusion Models${NO_COLOR}"
echo -e "${INFO_COLOR}        Models: $SD_MODELS${NO_COLOR}"
read -ra newarr <<< "$SD_MODELS"
for model_url in "${newarr[@]}";
do
    model_name=$(basename "$model_url")
    echo -e "${INFO_COLOR}            $model_name${NO_COLOR}"
    curl -Lo "/content/stable-diffusion-webui/models/$model_name" "$model_url"
done

## ControlNet Models
echo -e "${INFO_COLOR}    Installing ControlNet Models${NO_COLOR}"
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
echo -e "${INFO_COLOR}    Installing Stable Diffusion LoRAs${NO_COLOR}"
rm -rf /content/stable-diffusion-webui/models/Lora
cd /content/stable-diffusion-webui/models
git clone https://huggingface.co/Lucky555/Lora $QUIET

## Embeddings
echo -e "${INFO_COLOR}    Installing Stable Diffusion Embeddings${NO_COLOR}"
rm -rf /content/stable-diffusion-webui/embeddings
cd /content/stable-diffusion-webui
git clone https://huggingface.co/Lucky555/embeddings $QUIET

## VAE
echo -e "${INFO_COLOR}    Installing Stable Diffusion VAEs${NO_COLOR}"
rm -rf /content/stable-diffusion-webui/models/VAE
cd /content/stable-diffusion-webui/models
git clone https://huggingface.co/Lucky555/VAE $QUIET
cd /content/stable-diffusion-webui

## ESRGAN
echo -e "${INFO_COLOR}   Installing Stable Diffusion ESRGAN${NO_COLOR}"
cd /content/stable-diffusion-webui/models
git clone https://huggingface.co/nolanaatama/ESRGAN $QUIET
echo -e "${INFO_COLOR}Installation completed"

# Web UI tunnel
echo -e "${INFO_COLOR}Starting WebUI${NO_COLOR}"
