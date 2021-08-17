#!/usr/bin/env bash

# Install catkin tools and vcstools if you haven't done so before. Depending on your operating system
sudo apt-get install python-catkin-tools python-vcstool

# Install system dependencies and dependencies for Ceres Solver
# system dep.
sudo apt-get install libglew-dev libopencv-dev libyaml-cpp-dev 
# Ceres dep.
sudo apt-get install libblas-dev liblapack-dev libsuitesparse-dev

ROS-DISTRO=melodic

cd $ROS_WORKSPACES
mkdir $ROS_WORKSPACES/svo_ws && cd svo_ws

# see below for the reason for specifying the eigen path
catkin config --init --mkdirs --extend /opt/ros/$ROS-DISTRO --cmake-args -DCMAKE_BUILD_TYPE=Release -DEIGEN3_INCLUDE_DIR=/usr/include/eigen3
cd src

# git clone git@github.com:uzh-rpg/rpg_svo_pro_open.git
# ! VSLAB VERSION
git clone https://github.com/EnriqueSolarte/rpg_svo_pro_open.git
git checkout vslab

vcs-import < ./rpg_svo_pro_open/dependencies.yaml
touch minkindr/minkindr_python/CATKIN_IGNORE
# vocabulary for place recognition
cd rpg_svo_pro_open/svo_online_loopclosing/vocabularies && ./download_voc.sh
cd ../../..