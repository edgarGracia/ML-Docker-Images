# Ubuntu 20.04 | Cuda 11.7 | Cudnn 8 | Python 3.10 | Torch 1.13.1 | TensorFlow 2.11.0 | Detectron2
FROM nvidia/cuda:11.7.1-cudnn8-devel-ubuntu20.04

# Install dependencies
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y curl git wget ninja-build nano sudo ca-certificates build-essential ffmpeg \
    libsm6 libxext6 zip unzip

# Install Python 3.10
RUN apt-get install -y software-properties-common
RUN add-apt-repository --yes ppa:deadsnakes/ppa
RUN apt-get install -y python3.10 python3.10-distutils python3.10-dev python3.10-venv
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10

# Change the default python version
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1
RUN update-alternatives --set python /usr/bin/python3.10
RUN update-alternatives --set python3 /usr/bin/python3.10

# Create a non-root user
ARG USER_ID=1000
RUN useradd -m --no-log-init --system --uid ${USER_ID} user -g sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
ENV PATH="/home/user/.local/bin:$PATH"
USER user
WORKDIR /home/user

# Enable color prompt
RUN sed -i '/#force_color_prompt=yes/c\force_color_prompt=yes' /home/user/.bashrc

# Install python dependencies
RUN python -m pip install --upgrade pip
RUN python -m pip install --upgrade setuptools
RUN python -m pip install matplotlib==3.7.2 opencv-python-headless==4.8.0.76 Pillow==9.3.0 PyYAML \
    seaborn tensorboard cmake onnx onnxruntime-gpu tqdm cython pycocotools "fastapi[all]" scipy

# Install Torch
RUN python -m pip install torch==1.13.1+cu117 torchvision==0.14.1+cu117 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu117

# Install TensorFlow
RUN python -m pip install tensorflow==2.11.0

# Install detectron2
RUN python -m pip install --user 'git+https://github.com/facebookresearch/fvcore'
RUN git clone https://github.com/facebookresearch/detectron2 detectron2
RUN python -m pip install --user -e detectron2