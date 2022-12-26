FROM ubuntu:20.04
WORKDIR /invader

RUN mkdir /build
VOLUME [ "/build" ]

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York

RUN apt-get update && apt-get install -y software-properties-common

RUN add-apt-repository ppa:okirby/qt6-backports

RUN apt-get update && apt-get install -y \
    tzdata \
    curl \
    wget \
    zip \
    build-essential \
    g++-10 \
    cmake \
    python3 \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    zlib1g-dev \
    libarchive-dev \
    libtiff-dev \
    libfreetype6-dev \
    git \
    #libjpeg-dev \
    #libpng-dev \
    #libz-dev \
    #pkg-config \
    qt6-base-dev \
    # Qt5 only needed for backports or old commits
    #qt5-default \
    #qtmultimedia5-dev \
    #libzstd-dev \
    libsdl2-dev \
    libvulkan-dev \
    libflac-dev \
    libogg-dev \
    libvorbis-dev \
    libsamplerate-dev \
    libsquish-dev

RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 9 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-10 10 && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 9 && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 10
    
# Install rust and cargo
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y

# Install corrosion (https://github.com/corrosion-rs/corrosion)
RUN git clone https://github.com/corrosion-rs/corrosion.git && \
    cmake -Scorrosion -Bbuild -DCMAKE_BUILD_TYPE=Release && \
    cmake --build build --config Release && \
    cmake --install build --config Release

# Download SDL2 source and build it
RUN apt remove libsdl2-dev -y
RUN wget https://www.libsdl.org/release/SDL2-2.0.16.tar.gz && \
    tar -xzf SDL2-2.0.16.tar.gz && \
    cd SDL2-2.0.16 && \
    ./configure && \
    make && \
    make install
