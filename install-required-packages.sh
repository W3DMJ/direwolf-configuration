#! /bin/bash
echo "Installing required packages to compile and run direwolf TNC and ax25"

# Install everything required to compile direwolf
sudo apt install git git-lfs cmake build-essential libgps-dev libhamlib-dev libgpiod-dev libasound2-dev libudev-dev -y

# Create area to build direwolf
echo "Creating ~/Source/repos/amateur-radio-projects/ for cloning and compiling the direwolf github repository"
mkdir -p ~/Source/repos/amateur-radio-projects
cd ~/Source/repos/amateur-radio-projects

# Extracting the direwolf repo from github
git clone https://github.com/wb2osz/direwolf.git

# Setup the build directory and compile
cd direwolf
mkdir build
cd build
cmake ..
make

# Perform install of binaries and have installer
# generate the initial configuration files. Initial
# configutation files are placed in the user's home 
# directory
sudo make install
make install-conf
