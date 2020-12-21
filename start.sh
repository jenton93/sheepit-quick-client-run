#!/bin/bash

#######################
# User Credentials
#######################
username="click3rs" # your SheepIt username
pass="MNDBcov21PlAstsnC1TfWpEMr7GluMdmhRad9IAX" # your SheepIt password or key

#######################
# System settings
#######################
blenderDeps="blender default-jre" # Packages to install which will include required dependencies
# mem="5" # Amount of RAM for SheepIt (in GB)
gpu="--no-gpu" # if you have a GPU leave this empty
computeMethod="CPU" # leave blank if you are unsure
renderTime="82" # The max time you are willing to commit to render one frame

for dep in ${blenderDeps[@]}; do
    if ! dpkg -s $dep > /dev/null 2>&1; then
        echo; echo "#############################";
	printf "You need to install some missing packages which are required to run Blender. Running the following command will install all required dependencies.\n\nsudo apt install ${blenderDeps[@]}";
        echo; echo "#############################"; echo;
	exit;
    else
	echo "Is '${dep}' installed? ...YES";
    fi
done

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

echo;
# This will run the client with the settings above
java -jar client.jar $mem -ui text $gpu -cache-dir $HOME/sheepit-cache $computeMethod cores=6 $renderTime -login $username -password $pass
