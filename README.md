# packer-consul-vagrant
A vagrant box based on ubuntu xenial with consul

# Prerequisites
## Install vagrant
Grab vagrant and learn how to install it from [here](https://www.vagrantup.com/docs/installation/).

## Install packer
Grab packer and learn how to install it from [here](https://www.packer.io/intro/getting-started/install.html).


# How to build

    make
    

# Purpose

This repository attempts to store the minimum amount of code that is required to create a:
- Ubuntu Xenial64 box
- with Consul
- using Packer
- for VirtualBox

# To Do
- [ ] create makefile
- [ ] add consul to box
- [ ] add kitchen install
- [ ] create kitchen test
- [ ] add kitchen test to makefile

# Done
- [x] build initial readme
- [x] create json template file
- [x] copy boot provisioning script

