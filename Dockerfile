FROM dsarchive/base_docker_image
LABEL maintainer="Kitware, Inc. <kitware@kitware.com>"

# copy HistomicsTK files
ENV htk_path=$PWD/HistomicsTK
RUN mkdir -p $htk_path

# Insert commands to install any system pre-requisites and libraries here
# set up Python 3
RUN apt-get update &&\
RUN apt-get install -y python3 && \
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
RUN python3 get-pip.py.
COPY . $htk_path/
WORKDIR $htk_path

# git clone install slicer_cli_web
RUN mkdir -p /build && \
    cd /build && \
    git clone --branch 2.x-maintenance https://github.com/girder/slicer_cli_web.git

# define entrypoint through which all CLIs can be run
WORKDIR $htk_path/histomicstk/cli

# Copy files of the plugin into the docker container
ENV htk_path /opt/tda_plugin
COPY . $htk_path
COPY requirements.txt /opt/tda_plugin/Applications
WORKDIR $htk_path/Applications

# pip install python package dependencies in requirments.txt
RUN pip3 install -U -r requirements.txt

# Test our entrypoint.  If we have incompatible versions of numpy and
# openslide, one of these will fail
#RUN python /build/slicer_cli_web/server/cli_list_entrypoint.py --list_cli
#RUN python /build/slicer_cli_web/server/cli_list_entrypoint.py ColorDeconvolution --help

#ENTRYPOINT ["/bin/bash", "docker-entrypoint.sh"]
# use entrypoint of slicer_cli_web to expose slicer CLIS of this plugin on web
#ENTRYPOINT ["/build/miniconda/bin/python", "/build/slicer_cli_web/server/cli_list_entrypoint.py"]

RUN python /build/slicer_cli_web/server/cli_list_entrypoint.py --list_cli
