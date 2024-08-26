FROM nvidia/cuda:12.1.1-devel-ubuntu22.04

# Setup without using environment.yml

RUN apt update -y
RUN apt install -y wget

RUN apt install -y build-essential
RUN apt install -y python3 python3-pip python-is-python3
RUN pip install -U pip

RUN pip install typing_extensions==4.9.0

RUN pip install torch==2.0.0
RUN pip install torchaudio==2.0.0
RUN pip install torchvision==0.16.2

RUN pip install ffmpeg==1.4
RUN pip install pillow==10.2.0

#
RUN pip install open3d==0.18.0
RUN pip install mediapy==1.1.2
RUN pip install lpips==0.1.4
RUN pip install scikit-image==0.21.0
RUN pip install tqdm==4.66.2
RUN pip install trimesh==4.3.2
RUN pip install plyfile==1.0.3
RUN pip install opencv-python==4.10.0.84

RUN apt install -y ninja-build


RUN pip install 'numpy<2'
RUN apt install -y git wget
RUN apt install -y libgl1-mesa-dev
RUN apt install -y libglib2.0-0

RUN pip install tensorboard

# info from https://developer.nvidia.com/cuda-gpus
# DLBOX1: GeForce RTX 3090: cc(compute capability)=8.6
ENV TORCH_CUDA_ARCH_LIST="8.6+PTX"

WORKDIR /root/2d-gs

CMD ["/bin/bash"]