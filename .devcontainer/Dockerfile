ARG CUDA="12.6.0"
ARG UBUNTU="22.04"

# docker pull nvidia/cuda:12.6.0-cudnn-devel-ubuntu22.04
FROM nvidia/cuda:${CUDA}-cudnn-devel-ubuntu${UBUNTU}

RUN apt update && apt install -y --no-install-recommends \
    build-essential \
    cmake \
    cmake-data \
    gcc \
    g++ \
    ninja-build \
    gdb \
    git \
    wget \
    curl \
    unzip \
    yasm \
    doxygen \
    pkg-config \
    checkinstall \
    build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev \
    python3-dev python3-numpy \
    libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev \
    libswscale-dev libgtk-3-dev libv4l-dev v4l-utils\
    libopenblas-dev libopenblas-base libatlas-base-dev liblapacke-dev \
    protobuf-compiler python3-dev python3-venv python3-numpy python3-wheel python3-setuptools \
&& rm -rf /var/lib/apt/lists/*
     
  

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-pip \
  && rm -rf /var/lib/apt/lists/*

ARG USERNAME=user
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Check if "ubuntu" user exists, delete it if it does, then create the desired user
RUN if getent passwd ubuntu > /dev/null 2>&1; then \
        userdel -r ubuntu && \
        echo "Deleted existing ubuntu user"; \
    fi && \
    groupadd --gid $USER_GID $USERNAME && \
    useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME && \
    echo "Created new user $USERNAME"

# Add sudo support for the non-root user
RUN apt-get update && apt-get install -y sudo \
  && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
  && chmod 0440 /etc/sudoers.d/$USERNAME \
  && rm -rf /var/lib/apt/lists/*