FROM ubuntu:latest

# File Author / Maintainer
MAINTAINER Julian Popescu

# Add basic resources
RUN echo "deb http://archive.ubuntu.com/ubuntu/ $(lsb_release -sc) main universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y python3 \
					   python3-pip \
					   libffi-dev \
					   libatlas-dev \
					   libblas-dev \
					   liblapack-dev \
					   gfortran
RUN apt-get -y autoremove

# Fix UTF-8 encoding
ENV LC_ALL="C.UTF-8"
ENV LANG="C.UTF-8"

# Set LAPLACK, BLAS, ATLAS
ENV LAPACK="/usr/lib/liblapack.so"
ENV ATLAS="/usr/lib/libatlas.so"
ENV BLAS="/usr/lib/libblas.so"

# Install Numpy and Scipy
RUN pip3 install numpy
RUN pip3 install scipy
RUN pip3 install pandas