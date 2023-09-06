# Ubuntu 20.04 | cuda 11.7 | cudnn 8 | Python 3.10 | torch 1.13.1 | tensorflow 2.11.0 | detectron2
FROM nvidia/cuda:11.7.0-cudnn8-devel-ubuntu20.04

# Set non interactive
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y curl git wget ninja-build nano sudo ca-certificates build-essential

# Create a non-root user
ARG USER_ID=1000
RUN useradd -m --no-log-init --system --uid ${USER_ID} user -g sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER user
WORKDIR /home/user

# Enable color prompt
RUN sed -i '/#force_color_prompt=yes/c\force_color_prompt=yes' /home/user/.bashrc

# Install Python 3.10
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common
RUN sudo add-apt-repository --yes ppa:deadsnakes/ppa
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install -y python3.10 python3.10-distutils python3.10-dev python3.10-venv
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10
RUN export PATH=/home/user/.local/bin:$PATH

# Change the default python version
RUN sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1
RUN sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1
RUN sudo update-alternatives --set python /usr/bin/python3.10
RUN sudo update-alternatives --set python3 /usr/bin/python3.10

# Install python dependencies
RUN python -m pip install --upgrade pip
RUN python -m pip install --upgrade setuptools
RUN python -m pip install matplotlib==3.5.1 PyYAML==6.0 opencv-python-headless==4.6.0.66 seaborn==0.12.2 "fastapi[all]" scipy fastapi-utils onnxruntime-gpu
RUN python -m pip install tensorboard cmake onnx tqdm cython pycocotools pipreqs

# PyTorch
RUN python -m pip install torch==1.13.1+cu117 torchvision==0.14.1+cu117 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu117

# Tensorflow
RUN python -m pip install tensorflow==2.11.0

# Install detectron2
RUN python -m pip install --user 'git+https://github.com/facebookresearch/fvcore'
RUN git clone https://github.com/facebookresearch/detectron2 detectron2
ENV FORCE_CUDA="1"
ARG TORCH_CUDA_ARCH_LIST="Kepler;Kepler+Tesla;Maxwell;Maxwell+Tegra;Pascal;Volta;Turing"
ENV TORCH_CUDA_ARCH_LIST="${TORCH_CUDA_ARCH_LIST}"
RUN python -m pip install --user -e detectron2
