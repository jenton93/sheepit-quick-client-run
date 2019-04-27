#!/bin/bash

#######################
# User Credentials
#######################
username="x000111" # your SheepIt username
pass="BMZ4zE7My62vLgjxhtpfgGeSIIiL6afdeoeTh1dR" # your SheepIt password or key

#######################
# System settings
#######################
mem="" # RAM available to SheepIt (
gpu="--no-gpu" # if you have a GPU leave this empty
computeMethod="CPU" # leave blank if you are unsure
renderTime="" # The max time you are willing to commit to render one frame

if [ ! -f "client.jar" ]; then
    echo "SheepIt client not found. Downloading the client."
    wget -O client.jar https://www.sheepit-renderfarm.com/media/applet/client-latest.php
    chmod +x client.jar
fi

# This will run the client with the settings above
java -jar client.jar -memory $mem -ui text $gpu -cache-dir $HOME/sheepit-cache -compute-method $computeMethod -rendertime $renderTime -login $username -password $pass
