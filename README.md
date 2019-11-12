# MDStudio ATB

[![Build Status](https://travis-ci.org/MD-Studio/MDStudio_ATB.svg?branch=master)](https://travis-ci.org/MD-Studio/MDStudio_ATB)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/697c033fd7674ecea28c089150a25dfa)](https://www.codacy.com/app/marcvdijk/MDStudio_ATB?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=MD-Studio/MDStudio_ATB&amp;utm_campaign=Badge_Grade)
[![codecov](https://codecov.io/gh/MD-Studio/MDStudio_ATB/branch/master/graph/badge.svg)](https://codecov.io/gh/MD-Studio/MDStudio_ATB)

The MDStudio ATB service provides access to the [Automatic Topology Builder](https://atb.uq.edu.au) server (ATB) at the 
University of Queensland, Brisbane Australia.

## Installation Quickstart
MDStudio ATB can be used in the MDStudio environment as Docker container or as standalone service.

### Install option 1 Pre-compiled Docker container
MDStudio ATB can be installed quickly from a pre-compiled docker image hosted on DockerHub by:

    docker pull mdstudio/mdstudio_atb
    docker run (-d) mdstudio/mdstudio_atb

In this mode you will first need to launch the MDStudio environment itself in order for the MDStudio ATB service to 
connect to it. You can unify this behaviour by adding the MDStudio ATB service to the MDStudio service environment as:

    MDStudio/docker-compose.yml:
        
        services:
           mdstudio_atb:
              image: mdstudio/mdstudio_atb
              links:
                - crossbar
              environment:
                - CROSSBAR_HOST=crossbar
              volumes:
                - ${WORKDIR}/mdstudio_atb:/tmp/mdstudio/mdstudio_atb

And optionally add `mdstudio_atb` to MDStudio/core/auth/settings.dev.yml for automatic authentication and 
authorization at startup.

### Install option 2 custom build Docker container
You can custom build the MDStudio ATB Docker container by cloning the MDStudio_atb GitHub repository and run:

    docker build MDStudio_atb/ -t mdstudio/mdstudio_atb
    
After successful build of the container follow the steps starting from `docker run` in install option 1.

### Install option 3 standalone deployment of the service.
If you prefer a custom installation over a (pre-)build docker container you can clone the MDStudio_atb GitHub
repository and install `mdstudio_atb` locally as:

    pip install (-e) mdstudio_atb/

Followed by:

    ./entry_point_mdstudio_atb.sh
    
or

    export MD_CONFIG_ENVIRONMENTS=dev,docker
    python -u -m mdstudio_atb
