DLS Developer Container
=======================

A Diamond Light Source developer container.

A generic container for working on multiple projects at the same time.

This is distinct from dev-c7 which emulates the old RHEL7 developer workflow.
It is intended for building and testing containerized DLS applications.

Features
--------
- OIDC login for use with DLS kubernetes clusters
- maps in .ssh from host $HOME
- Python 10
- C++ tools 
- what else do we need?
- TODO some way of mapping in /repos/epics to do IOC and support module dev

Setup of Host 
-------------

- copy .bashrc_dev into your home directory and modify as you see fit
- this allows for a common set of bash startup for all devcontainers

To use with VSCode
------------------

- Copy the .devcontainer folder to same folder as the workspace file.
- Open the workspace in VSCode
- Accept the prompt 'reopen in container'

To use on command line 
----------------------
TODO provide some scripts for this as the volume maps will get complex eventually
- cd into .devcontainer 
- podman build -t dev-all .
- podman run -v $HOME/.bashrc_dev:/root/.bashrc dev-all


