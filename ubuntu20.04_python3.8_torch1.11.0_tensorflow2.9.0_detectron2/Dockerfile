# Ubuntu 20.04 | Python 3.8 | Torch 1.11 | TensorFlow 2.9.0 | Detectron2
FROM ubuntu:20.04

# Set non interactive
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y curl git wget ninja-build nano sudo ca-certificates build-essential ffmpeg \
    libsm6 libxext6 zip unzip

# Install Python 3.8
RUN apt-get install -y software-properties-common
RUN add-apt-repository --yes ppa:deadsnakes/ppa
RUN apt-get install -y python3.8 python3.8-distutils python3.8-dev python3.8-venv
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.8

# Change the default python version
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1
RUN update-alternatives --set python /usr/bin/python3.8
RUN update-alternatives --set python3 /usr/bin/python3.8

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
RUN python -m pip install torch==1.11.0 torchvision==0.12.0 torchaudio==0.11.0

# Install TensorFlow
RUN python -m pip install tensorflow==2.9.0

# Install Detectron2
RUN python -m pip install detectron2 -f https://dl.fbaipublicfiles.com/detectron2/wheels/cpu/torch1.8/index.html