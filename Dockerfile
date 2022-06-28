FROM ubuntu:20.04

RUN apt-get update
RUN apt-get -y upgrade

ENV DEBIAN_FRONTEND=noninteractive

RUN apt -y install build-essential git m4 scons zlib1g zlib1g-dev \
    libprotobuf-dev protobuf-compiler libprotoc-dev libgoogle-perftools-dev \
    python3-dev python3-six python-is-python3 doxygen libboost-all-dev \
    libhdf5-serial-dev python3-pydot libpng-dev libelf-dev pkg-config pip \
    python3-venv sudo curl wget vim nano

RUN apt -y install gcc-arm-linux-gnueabihf
RUN apt -y install g++-arm-linux-gnueabihf

RUN pip install mypy

RUN apt -y install zsh
RUN chsh -s /bin/zsh

RUN useradd -ms /bin/zsh user -G sudo -u 1000

RUN echo 'user:user' | chpasswd

USER user
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ENTRYPOINT [ "/bin/zsh" ]

