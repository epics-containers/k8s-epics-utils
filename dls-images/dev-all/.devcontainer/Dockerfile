# ideas from https://www.docker.com/blog/containerized-python-development-part-1/

# This file is for use as a .vscode devcontainer as well as a runtime 
# container. The devcontainer should be rootful and use podman or docker 
# with user namespaces.

ARG BASE="mcr.microsoft.com/vscode/devcontainers/python:0-3.10-bullseye"
FROM ${BASE} as developer

# use root to pin where the packages will install
USER root
ENV PATH=/root/.local/bin:$PATH

# things to make pyQt5 work
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y --no-install-recommends \
    libqt5gui5 libxcb-xinerama0  
ENV XDG_RUNTIME_DIR=/tmp/runtime-vscode

RUN pip install pip --upgrade

# instal OIDC and kubectl
RUN ( \
    cd "$(mktemp -d)" && \
    curl -fsSLO https://github.com/kubernetes-sigs/krew/releases/download/v0.4.3/krew-linux_amd64.tar.gz && \
    tar zxvf krew-linux_amd64.tar.gz && \
    ./krew-linux_amd64 install krew && \
    ~/.krew/bin/kubectl-krew install oidc-login && \
    curl -LO https://dl.k8s.io/release/v1.24.0/bin/linux/amd64/kubectl && \
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl \
    )