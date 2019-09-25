
# Environment for ROSE compiler development.

# Pull base image.
FROM ubuntu:16.04

# Install packages.
RUN \
    useradd rose-dev && \
    apt-get update && \
    apt-get install -y \
        apt-utils \
        dialog \
        python-software-properties \
        software-properties-common && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y \ 
        autoconf \
        automake \
        autotools-dev \
        bc \
        binutils \
        bison \
        build-essential \
        cmake \
        cpufrequtils \
        curl \
        device-tree-compiler \
        dkms \
        doxygen \
        flex \
        gawk \
        gcc-multilib \
        gdb \
        gfortran \
        ghostscript \
        git \
        gperf \
        graphviz \
        libboost-all-dev \
        libgmp-dev \
        libhpdf-dev \
        libmpc-dev \
        libmpfr-dev \
        libomp-dev \
        libtool \
        libxml2-dev \
        patchutils \
        perl-doc \
        python3-dev \
        sqlite \
        texinfo \
        unzip \
        vim \
        wget \
        zip \
        zlib1g \
        zlib1g-dev && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/*

# Setup environment
ENV ROSE_SRC /rose/rose_src
ENV ROSE_PATH /rose/rose_install
ENV ROSE_BUILD /rose/rose_build
ENV PATH $ROSE_PATH/bin:$PATH
ENV LD_LIBRARY_PATH $ROSE_PATH/lib:$LD_LIBRARY_PATH
ENV LIBRARY_PATH $ROSE_PATH/lib:$LIBRARY_PATH

# Define working directory.
WORKDIR /rose

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV LD_LIBRARY_PATH $JAVA_HOME/jre/lib/amd64/server:/usr/lib/x86_64-linux-gnu

# Username doesn't need to be defined. The host user has to be passed into Docker for correct file permissions.

# Define default command.
CMD ["bash"]
