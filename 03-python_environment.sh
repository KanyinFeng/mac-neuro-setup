#!/bin/bash

if [ -z ${SETUP_ROOT} ]
then
    source envs
fi

# Create default conda enviornment on Mac
echo "Current conda: $(which conda)"

# Add conda-forge channel
conda config --add channels conda-forge

# Environment name
ENV_PREFIX=${SETUP_ROOT}/pyenv
echo "Enviromenmet location: ${ENV_PREFIX}"

# Create environment
conda create -p ${ENV_PREFIX} -y python=3.8

# Activate environment
source $(conda info --base)/etc/profile.d/conda.sh
conda activate ${ENV_PREFIX}

# Install packages using conda
conda install -yq \
    numpy \
    pandas \
    scipy \
    statsmodels \
    scikit-learn \
    scikit-image \
    xgboost \
    ipython \
    jupyterlab \
    python-language-server \
    xeus-python \
    matplotlib \
    seaborn \
    plotly \
    bokeh \
    graphviz \
    vtk \
    mayavi \
    ffmpeg \
    ipywidgets \
    'nodejs>=10' \
    spyder \
    mpi4py \
    h5py \
    feather-format \
    cython \
    pybind11 \
    flake8 \
    autopep8 \
    black \
    yapf \
    pytest \
    jupyterlab_code_formatter \
    jupytext \
    nbdime \
    python-dotenv \
    cookiecutter \
    nilearn \
    nipype \
    mne \
    gensim \
    pyrsistent \
    pint \
    py4j \
    s3fs \
    ipyvolume
conda install -yq -c plotly plotly-orca
conda install -yq -c defaults tensorflow tensorflow-gpu
conda install -yq -c pytorch pytorch torchvision cudatoolkit

# Install package through pip
pip install --no-cache-dir \
    jupyter-lsp \
    pyls-black \
    memory_profiler \
    rpy2 \
    radian \
    pymer4 \
    sklearn-lmer \
    umap-learn \
    rootpath \
    bigmpi4py \
    pymanopt \
    theano \
    dcmstack \
    pybids \
    heudiconv \
    bidscoin \
    antspyx \
    pymvpa2 \
    visualqc \
    neuropythy \
    fse \
    ppca && \
pip install brainiak --no-deps --no-use-pep517  --no-cache-dir && \
pip install hypertools --no-deps --no-cache-dir

# Install jupyterlab extensions
jupyter labextension install @jupyter-widgets/jupyterlab-manager
jupyter labextension install @krassowski/jupyterlab-lsp
jupyter labextension install @jupyterlab/debugger
jupyter labextension install @ryantam626/jupyterlab_code_formatter
jupyter labextension install jupyterlab-plotly
jupyter labextension install plotlywidget
jupyter labextension install jupyterlab-jupytext
jupyter labextension install ipyvolume
jupyter labextension install jupyter-threejs

# Cleanup
conda clean -apy
jupyter lab clean

echo "Installation completed!"