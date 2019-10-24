FROM girder/slicer_cli_web
MAINTAINER Deepak Roy Chittajallu <deepak.chittajallu@kitware.com>


# Copy files of the plugin into the docker container
ENV SLICER_CLI_WEB_PLUGIN_PATH /opt/tda_plugin
COPY . $SLICER_CLI_WEB_PLUGIN_PATH
COPY requirements.txt /opt/tda_plugin/Applications
WORKDIR $SLICER_CLI_WEB_PLUGIN_PATH/Applications

# Insert commands to install any system pre-requisites and libraries here
# set up Python 3
RUN apt-get update 
RUN apt-get install -y python3.5
RUN apt-get -y install python3-pip
RUN pip3 install --upgrade pip

# pip install python package dependencies in requirments.txt
RUN pip3 install -U -r requirements.txt

# use entrypoint of slicer_cli_web to expose slicer CLIS of this plugin on web
ENTRYPOINT ["/build/miniconda/bin/python3", "/build/slicer_cli_web/server/cli_list_entrypoint.py"]
