FROM dsarchive/base_docker_image
LABEL maintainer="Kitware, Inc. <kitware@kitware.com>"

# copy HistomicsTK files
ENV htk_path=$PWD/HistomicsTK
RUN mkdir -p $htk_path

# Insert commands to install any system pre-requisites and libraries here
# set up Python 3
RUN apt-get update 

# git clone install slicer_cli_web
RUN mkdir -p /build && \
    cd /build && \
    git clone --branch 2.x-maintenance https://github.com/girder/slicer_cli_web.git

# Copy files of the plugin into the docker container
ENV SLICER_CLI_WEB_PLUGIN_PATH /opt/tda_plugin
COPY . $SLICER_CLI_WEB_PLUGIN_PATH
COPY requirements.txt /opt/tda_plugin/Applications
WORKDIR $SLICER_CLI_WEB_PLUGIN_PATH/Applications


# define entrypoint through which all CLIs can be run
WORKDIR $htk_path/histomicstk/cli

# Test our entrypoint.  If we have incompatible versions of numpy and
# openslide, one of these will fail
#RUN python /build/slicer_cli_web/server/cli_list_entrypoint.py --list_cli
#RUN python /build/slicer_cli_web/server/cli_list_entrypoint.py ColorDeconvolution --help

#ENTRYPOINT ["/bin/bash", "docker-entrypoint.sh"]
# use entrypoint of slicer_cli_web to expose slicer CLIS of this plugin on web
ENTRYPOINT ["/build/miniconda/bin/python", "/build/slicer_cli_web/server/cli_list_entrypoint.py"]
