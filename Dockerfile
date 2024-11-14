ARG PYTHON_VERSION=3.10.12
FROM python:${PYTHON_VERSION}-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --upgrade pip

# Torch
ARG PIP_TORCH=torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
RUN pip3 install $PIP_TORCH

# Hugging face
ARG PIP_HF=accelerate datasets transformers
RUN pip3 install $PIP_HF

# Other modules
ARG PIP_OTHER=""
RUN if [ -n "$PIP_OTHER" ]; then pip install $PIP_OTHER; fi

# Project modules
ARG PIP_PROJECT=""
RUN if [ -n "$PIP_PROJECT" ]; then pip install $PIP_PROJECT; fi

# Docker user
ARG DOCKER_USER
RUN adduser --uid 1000 --disabled-password --gecos '' $DOCKER_USER

RUN mkdir /proj
WORKDIR /proj

# This sets up a good torch environment
# * Add if needed
