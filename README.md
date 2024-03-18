# ML Docker Images

A collection of some Docker images for machine learning

| Dockerfile | Docker Hub | CUDA | cuDNN | OS | Python | Torch | Tensorflow | Extra | Size |
|-|-|-|-|-|-|-|-|-|-|
|[Dockerfile](cuda12.1_cudnn8_ubuntu22.04_python3.11_torch2.2.0_tensorflow2.15.0_hf/Dockerfile)|[Tag](https://hub.docker.com/layers/egracia/ml/cuda12.1_cudnn8_ubuntu22.04_python3.11_torch2.2.0_tensorflow2.15.0_hf/images/sha256-a489dff6e84058cbfbfdef5c5bb6c45286cf57373ccfb3d89ecdfec684b0f97b)|12.1.0|8|Ubuntu 22.04|3.11|2.2.0|2.15.0|transformers + diffusers  + accelerate|13.18 GB|
|[Dockerfile](cuda11.8_cudnn8_ubuntu22.04_python3.11_torch2.0.1_tensorflow2.13.0/Dockerfile)|[Tag](https://hub.docker.com/layers/egracia/ml/cuda11.8_cudnn8_ubuntu22.04_python3.11_torch2.0.1_tensorflow2.13.0/images/sha256-a170333df6cf25ee4699067cb6e119c8c8b260236cc7052b2fdb88c947c617a9)|11.8.0|8|Ubuntu 22.04|3.11|2.0.1|2.13.0|-|11.53 GB|
|[Dockerfile](cuda11.7_cudnn8_ubuntu20.04_python3.10_torch1.13.1_tensorflow2.11.0_detectron2/Dockerfile)|[Tag](https://hub.docker.com/layers/egracia/ml/cuda11.7_cudnn8_ubuntu20.04_python3.10_torch1.13.1_tensorflow2.11.0_detectron2/images/sha256-a2d091994cb4b5dfdd7a335c5df5981423fd63bf8e971dbe2024981cf0046742)|11.7.1|8|Ubuntu 20.04|3.10|1.13.1|2.11.0|Detectron2|9.53 GB|
|[Dockerfile](ubuntu20.04_python3.8_torch1.11.0_tensorflow2.9.0_detectron2/Dockerfile)|[Tag](https://hub.docker.com/layers/egracia/ml/ubuntu20.04_python3.8_torch1.11.0_tensorflow2.9.0_detectron2/images/sha256-e4416514c94bbf7b7f4d3d0600375ebb6ec3633176065317d0e361f2381a15fd)|-|-|Ubuntu 20.04|3.8|1.11.0|2.9.0|Detectron2|3.48 GB|