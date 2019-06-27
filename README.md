# packer-consul-vagrant
A vagrant box based on ubuntu xenial with consul

# Prerequisites
## Install vagrant
Grab vagrant and learn how to install it from [here](https://www.vagrantup.com/docs/installation/).

## Install packer
Grab packer and learn how to install it from [here](https://www.packer.io/intro/getting-started/install.html).

## Install kitchen & prerequisites
Brace yourself for this one... Lifted from @kikitux with thanks.

### rbenv prerequisite

On MacOS:
```
brew install rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
rbenv init
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
```

On Linux:
> Note:
> On Graphical environments, when you open a shell, sometimes `~/.bash_profile` doesn't get loaded
> You may need to `source ~/.bash_profile` manually or use `~/.bashrc`

```
apt update
apt install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev
wget -q https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer -O- | bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
rbenv init
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
```

### bundle prerequisite

```
rbenv install 2.4.6 # this one works at the time of writing
rbenv local 2.4.6   # change to a newer version if needed
rbenv versions
gem install bundler
bundle install
```

# How to build

    make
    

# How to test

```
bundle exec kitchen converge
bundle exec kitchen verify
bundle exec kitchen destroy
```

Or in one-shot:

```
bundle exec kitchen test
```


# Purpose

This repository attempts to store the minimum amount of code that is required to create a:
- Ubuntu Xenial64 box
- with Consul
- using Packer
- for VirtualBox

# To Do
- [ ] create kitchen test
- [ ] add kitchen test to makefile

# Done
- [x] build initial readme
- [x] create json template file
- [x] copy boot provisioning script
- [x] create makefile
- [x] add consul to box
- [x] add kitchen install

