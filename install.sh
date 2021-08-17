#!/usr/bin/env bash

# Install catkin tools and vcstools if you haven't done so before. Depending on your operating system
sudo apt-get install python-catkin-tools python-vcstool

# Install system dependencies and dependencies for Ceres Solver
# system dep.
sudo apt-get install libglew-dev libopencv-dev libyaml-cpp-dev 
# Ceres dep.
sudo apt-get install libblas-dev liblapack-dev libsuitesparse-dev

ROS-DISTRO=melodic