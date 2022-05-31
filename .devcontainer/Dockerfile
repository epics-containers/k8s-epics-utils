# A global developer container for working on multiple projects
# (because project devcontainers target their specific project only)

ARG BASE="mcr.microsoft.com/vscode/devcontainers/python:0-3.10-bullseye"
FROM ${BASE} as developer

# use root to pin where the packages will install
USER root
ENV PATH=/root/.local/bin:$PATH

WORKDIR /workspace

# Here we could install anyhting we want into user packages 
# COPY dist dist

# # install runtime from DIST if there is one
# RUN mkdir -p /root/.local && \
#     if [ -d dist ] ; then \
#     touch requirements.txt && \
#     pip install --user -r requirements.txt dist/*.whl ; \
#     fi
