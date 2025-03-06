# Use PyTorch runtime image as the base
FROM pytorch/pytorch:2.1.2-cuda11.8-cudnn8-devel

# Set environment variables for CUDA
ENV CUDA_HOME=/usr/local/cuda
ENV PATH=$CUDA_HOME/bin:$PATH
ENV LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH
ENV TORCH_CUDA_ARCH_LIST="7.5;8.0;8.6+PTX;8.9;9.0" 

# Use bash as default
SHELL ["/bin/bash", "-c"]
ENV SHELL=/bin/bash

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update the system and install Python 3.8 with necessary tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3-pip \
    python3-setuptools \
    python-is-python3 \
    tree \
    wget \
    ffmpeg \
    libsm6 \
    libxext6 \
    g++ && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

    
# Set working directory
WORKDIR /app

# Upgrade pip to the latest version
RUN pip install --no-cache-dir --upgrade pip

# Copy your application files to the container
COPY . .

# Install dependencies if there's a requirements.txt
RUN pip install --no-cache-dir -r requirements.txt && \
    rm -rf /app/*