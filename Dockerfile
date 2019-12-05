<<<<<<< HEAD
﻿FROM dsarchive/base_docker_image
=======
FROM dsarchive/base_docker_image
>>>>>>> c370dafffe9a47592bccecd16aa2087b13ad1827
LABEL maintainer="Kitware, Inc. <kitware@kitware.com>"

# copy HistomicsTK files
ENV htk_path=$PWD/HistomicsTK
RUN mkdir -p $htk_path
<<<<<<< HEAD

<<<<<<< HEAD
# Insert commands to install any system pre-requisites and libraries here
# set up Python 3
RUN apt-get update &&\
RUN apt-get install -y python3 && \
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
RUN python3 get-pip.py.
=======
>>>>>>> 33ef9fa97bd56c294be3b8e6431953ab90b834a3

# git clone install slicer_cli_web
RUN mkdir -p /build && \
    cd /build && \
    git clone --branch 2.x-maintenance https://github.com/girder/slicer_cli_web.git
=======
>>>>>>> c370dafffe9a47592bccecd16aa2087b13ad1827

# Insert commands to install any system pre-requisites and libraries here
# set up Python 3
RUN apt-get update 

# git clone install slicer_cli_web
RUN mkdir -p /build && \
    cd /build && \
    git clone --branch 2.x-maintenance https://github.com/girder/slicer_cli_web.git
# define entrypoint through which all CLIs can be run
WORKDIR $htk_path/histomicstk/cli
# Copy files of the plugin into the docker container
ENV SLICER_CLI_WEB_PLUGIN_PATH /opt/tda_plugin
COPY . $SLICER_CLI_WEB_PLUGIN_PATH
COPY requirements.txt /opt/tda_plugin/Applications
WORKDIR $SLICER_CLI_WEB_PLUGIN_PATH/Applications

<<<<<<< HEAD
# Insert commands to install any system pre-requisites and libraries here
# set up Python 3
RUN apt-get update 
RUN apt-get install -y python3.5
RUN apt-get -y install python3-pip
RUN pip3 install --upgrade pip

<<<<<<< HEAD
# define entrypoint through which all CLIs can be run
WORKDIR $htk_path/histomicstk/cli

# Test our entrypoint.  If we have incompatible versions of numpy and
# openslide, one of these will fail
RUN python /build/slicer_cli_web/server/cli_list_entrypoint.py --list_cli
RUN python /build/slicer_cli_web/server/cli_list_entrypoint.py ColorDeconvolution --help

ENTRYPOINT ["/bin/bash", "docker-entrypoint.sh"]
=======
# pip install python package dependencies in requirments.txt
RUN pip3 install -U -r requirements.txt
>>>>>>> 33ef9fa97bd56c294be3b8e6431953ab90b834a3
=======
# Test our entrypoint.  If we have incompatible versions of numpy and
# openslide, one of these will fail
#RUN python /build/slicer_cli_web/server/cli_list_entrypoint.py --list_cli
#RUN python /build/slicer_cli_web/server/cli_list_entrypoint.py ColorDeconvolution --help
>>>>>>> c370dafffe9a47592bccecd16aa2087b13ad1827

#ENTRYPOINT ["/bin/bash", "docker-entrypoint.sh"]
# use entrypoint of slicer_cli_web to expose slicer CLIS of this plugin on web
#ENTRYPOINT ["/build/miniconda/bin/python", "/build/slicer_cli_web/server/cli_list_entrypoint.py"]
<<<<<<< HEAD
=======
RUN python /build/slicer_cli_web/server/cli_list_entrypoint.py --list_cli
>>>>>>> c370dafffe9a47592bccecd16aa2087b13ad1827
