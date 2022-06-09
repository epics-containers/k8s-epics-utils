# Generic DevContainer

Drop a link to this folder next to your workspace file or in and individual
work folder to allow launch of vscode in a container for that workspace or 
folder. 

e.g.
```
ln -s ~/work/k8s-epics-utils/.devcontainer .
```

This maps these files to give some history and bash settings consistency as 
well making the user's ssh keys available:

HOST -> CONTAINER
.ssh -> /root/.ssh
.bashrc -> /root/.bashrc_dev
.bash_history -> /root/.bash_history
.inputrc -> /root/.inputrc

NOTE copy .bashrc_dev to your home folder and modify as needed.
