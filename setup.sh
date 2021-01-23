#!/usr/bin/env bash

UNREAL_DIR=$HOME/src/UnrealEngine
AIRSIM_DIR=$HOME/src/AirSim

sudo apt install curl git python-pip

# Set up ROS, checking if it is installed first
if [ ! -d /opt/ros/melodic ]; then
  echo 'Installing ROS'
  if [ ! -f /etc/apt/sources.list.d/ros-latest.list ]; then
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
  fi
  
  sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
  curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | sudo apt-key add -
  sudo apt update
  sudo apt install ros-melodic-desktop-full
  echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
  source ~/.bashrc
  sudo apt install \
    python-rosdep \
    python-rosinstall \
    python-rosinstall-generator \
    python-wstool build-essential \
    python-catkin-tools
  if [ ! -f /etc/ros/rosdep/sources.list.d/20-default.list ]; then
    sudo rosdep init
  fi
  rosdep update
else
  echo 'ROS appears to be already installed'
  source ~/.bashrc
  sudo apt install python-catkin-tools
fi

# Now install Unreal Engine
if [ ! -d ${UNREAL_DIR} ]; then
  echo 'Installing Unreal Engine'
  sudo apt install build-essential git git-lfs gcc-8 g++-8 python-catkin-tools
  if [ ! -d ~/src ]; then
    mkdir ~/src
  fi
  
  # If there is an SSH key, assume we should use the git protocol
  if [ ! -f ~/.ssh/id_rsa ]; then
    git clone --depth=1 --branch=4.24 https://github.com/EpicGames/UnrealEngine.git ${UNREAL_DIR}
  else
    git clone --depth=1 --branch=4.24 git@github.com:EpicGames/UnrealEngine.git ${UNREAL_DIR}
  fi
else
  echo 'Unreal Engine is already installed'
fi

cd ${UNREAL_DIR}
bash Setup.sh
bash GenerateProjectFiles.sh
make -j4

# Install UE4 CLI
sudo -H pip install ue4cli
ue4 setroot ${UNREAL_DIR}

# Install AirSim
if [ ! -d ${AIRSIM_DIR} ]; then
  echo 'Installing AirSim'
  if [ ! -f ~/.ssh/id_rsa ]; then
    git clone https://github.com/swri-robotics/AirSim.git ${AIRSIM_DIR}
  else
    git clone git@github.com:swri-robotics/AirSim.git ${AIRSIM_DIR}
  fi
else
  echo 'AirSim already installed'
fi

if [ ! -d ${AIRSIM_DIR}/Unreal/Environments/ ]; then
  mkdir -p ${AIRSIM_DIR}/Unreal/Environments/
fi

cd ${AIRSIM_DIR}/Unreal/Environments

if [ ! -d Neighborhood ]; then
  git clone https://github.com/swri-robotics/Neighborhood.git
fi

cd ${AIRSIM_DIR}
bash setup.sh
bash build-neighborhood.sh
cd ${AIRSIM_DIR}/Unreal/Environments/Neighborhood
ue4 build

# Build the AirSim to ROS interface
echo 'Building AirSim/ROS interface'
cd ${AIRSIM_DIR}/ros
rosdep install src -y --from-paths -i
if [ ! -d .catkin_tools ]; then
  catkin init
fi
catkin config -e /opt/ros/melodic
catkin config --install
catkin config --cmake-args -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_C_COMPILER=gcc-8 -DCMAKE_CXX_COMPILER=g++-8

# Copy the settings file to the appropriate folder
echo 'Finishing installation'
if [ ! -d $HOME/Documents/AirSim ]; then
  mkdir $HOME/Documents/AirSim/
fi
cp ${AIRSIM_DIR}/Unreal/Environments/Neighborhood/settings.json $HOME/Documents/AirSim/

echo 'All done'
