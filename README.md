# Easy AirSim Installation

This repository contains utilities for simplifying the installation of AirSim
and Unreal Engine. Please follow the following instructions to setup up your
computer with the simulation environment.

## Prerequisites
This assumes your computer is running Ubuntu 18.04. It is also possible to run
this script inside of a virtual machine, such as a VMWare or VirtualBox image.
It has been tested using VMWare Workstation 15.5 running an Ubuntu 18.04 image.

The installation procedure assumes that ROS, Unreal Engine, and AirSim are not
installed. It does simple checks to avoid overwriting existing installations,
 but users should be cautious.

Please note that the simulation is very resource intensive, and ideally will
have a fast CPU, at least 16GB of RAM, and GPU acceleration, even if running
inside a virtual machine. This installation procedure was tested on a
workstation with an AMD 3600x, 32GB of memory, and an Nvidia 1080Ti GPU. The
installation script was tested in a virtual machine with 6 virtual processor
cores, 16GB of memory, and 3GB of video memory. Please note that building
Unreal with this script will use 4 parallel jobs, and consume almost 16GB of
memory. After building the software, approximately 115GB of disk space are
used.

## GitHub Signup
AirSim uses Unreal Engine, which requires a GitHub account and access to the
Epic Games team to install. These are all free accounts, but it may take several
days to be approved for the Epic Games account.

First, go to [GitHub](https://www.github.com) and register for an account.
Adding an SSH key to your account is not necessary, but will make cloning
repositories easier. To add an SSH key to your GitHub account, you can follow
the procedure [here](https://help.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account).

Unreal Engine is publicly accessible, but you must request access to the Epic
Games source code first. After signing up for GitHub, follow the instructions
located [here](https://www.unrealengine.com/en-US/ue4-on-github) to gain accesss
to the Unreal Engine repository.

## Installation
Once you have a GitHub account and are part of the Unreal Engine group, the
```setup.sh``` script located in this repository will install ROS Melodic, 
Unreal Engine, AirSim, and the Neighborhood environment. Simply clone this
repository or download the script, and from the Linux terminal, run the
following commmand

```bash
bash setup.sh
```

The script will then go through the installation process, prompting you for
your user name and possibly GitHub credentials at several points. Note that the
build process will take a very long time, possibly several hours.

## Post Installation
This script will build an example ROS node inside the ${HOME}/src/AirSim/ros
workspace that contains an example of subscribing to various sensor nodes
and publishing commands to a ground vehicle.
