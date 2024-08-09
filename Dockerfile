FROM runpod/pytorch:2.1.0-py3.10-cuda11.8.0-devel-ubuntu22.04

COPY . .

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update \
	&& apt install -y --no-install-recommends python3-dev python3-pip python3-setuptools libglib2.0-0 libgl1-mesa-glx 	\
	&& pip3 install --upgrade pip \
	&& pip3 install --no-cache-dir -r requirements.txt paddlepaddle-gpu && apt clean && rm -rf /var/lib/apt/lists/* 