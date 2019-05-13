#!/bin/bash

#######################
# User Credentials
#######################
username="x000111" # your SheepIt username
pass="BMZ4zE7My62vLgjxhtpfgGeSIIiL6afdeoeTh1dR" # your SheepIt password or key

#######################
# System settings
#######################
mem="4" # Amount of RAM for SheepIt (in GB)
gpu="--no-gpu" # if you have a GPU leave this empty
computeMethod="CPU" # leave blank if you are unsure
renderTime="" # The max time you are willing to commit to render one frame

if [ ! -f "client.jar" ]; then
    echo "SheepIt client not found. Downloading the client."
    wget -O client.jar https://www.sheepit-renderfarm.com/media/applet/client-latest.php
    chmod +x client.jar
fi

if [ ! -z $mem ]; then
    mem="-memory ${mem}G"
fi

if [ ! -z $computeMethod ]; then
    computeMethod="-compute-method ${computeMethod}"
fi

if [ ! -z $renderTime ]; then
    renderTime="-rendertime ${renderTime}"
fi                                                                                                                             

# This will run the client with the settings above
java -jar client.jar $mem -ui text $gpu -cache-dir $HOME/sheepit-cache $computeMethod $renderTime -login $username -password $pass
