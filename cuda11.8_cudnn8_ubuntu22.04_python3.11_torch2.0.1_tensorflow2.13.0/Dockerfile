# Ubuntu 22.04 | Cuda 11.8 | Cudnn 8 | Python 3.11 | Torch 2.0.1 | TensorFlow 2.13.0
FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04

# Install dependencies
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y curl git wget ninja-build nano sudo ca-certificates build-essential ffmpeg \
    libsm6 libxext6 zip unzip cmake

# Install Python 3.11
RUN apt-get install -y software-properties-common
RUN add-apt-repository --yes ppa:deadsnakes/ppa
RUN apt-get install -y python3.11 python3.11-distutils python3.11-dev python3.11-venv
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.11

# Change the default python version
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.11 1
RUN update-alternatives --set python /usr/bin/python3.11

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
    seaborn tensorboard cmake onnx onnxruntime-gpu tqdm cython pycocotools "fastapi[all]" scipy \
    scikit-image scikit-learn ipython

# Install Torch
RUN python -m pip install torch==2.0.1 torchvision==0.15.2 torchaudio==2.0.2 --index-url https://download.pytorch.org/whl/cu118

# Install TensorFlow
RUN python -m pip install tensorflow==2.13.0

# Install nvtop
RUN sudo apt-get install -y libdrm-dev libsystemd-dev libncurses5-dev libncursesw5-dev
RUN git clone https://github.com/Syllo/nvtop.git
RUN mkdir -p nvtop/build
WORKDIR nvtop/build
RUN cmake .. -DNVIDIA_SUPPORT=ON -DAMDGPU_SUPPORT=ON -DINTEL_SUPPORT=ON
RUN make
RUN sudo make install
WORKDIR /home/user
