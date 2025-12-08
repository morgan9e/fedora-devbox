FROM registry.fedoraproject.org/fedora-toolbox:43

RUN dnf install -y \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm \
    && dnf clean all

RUN dnf update -y && dnf clean all

RUN dnf install -y \
    fedpkg fedora-packager rpmdevtools ncurses-devel pesign git \
    bpftool bc bison dwarves elfutils-devel flex gcc gcc-c++ gcc-plugin-devel \
    glibc-static hostname m4 make net-tools openssl openssl-devel perl-devel \
    perl-generators python3-devel which kernel-rpm-macros vim \
    cmake ninja-build meson autoconf automake libtool pkgconfig ccache sccache \
    curl wget httpie \
    tar gzip bzip2 xz zstd zip unzip \
    python3 python3-pip python3-virtualenv pipx \
    rust cargo golang \
    && dnf clean all

RUN rpmdev-setuptree

RUN mkdir -p /data
WORKDIR /data

CMD ["/bin/bash"]