#!/bin/bash

. /opt/conda/etc/profile.d/conda.sh

if ! command -v conda &> /dev/null
then
    echo "Error: conda not found. Please install conda and try again."
    exit 1
fi

if ! conda create --prefix /home/jovyan/initkernel python=3.11
then
    echo "Error: failed to create conda environment."
    exit 1
fi

if ! conda activate /home/jovyan/initkernel
then
    echo "Error: failed to activate conda environment."
    exit 1
fi

if ! conda install -c anaconda ipykernel
then
    echo "Error: failed to install ipykernel package."
    exit 1
fi

if ! python3 -m ipykernel install --user --name=initkernel
then
    echo "Error: failed to install new kernel."
    exit 1
fi

echo "Script successfully activated a new conda environment with name 'initkernel'."
