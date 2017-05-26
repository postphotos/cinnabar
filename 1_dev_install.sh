#!/bin/bash
# Bash script to set up DevEnvs on a Mac for Vagrant, NPM and HomeBrew.
cd ~/

echo  "Welcome to the DevEnvs install!"
echo  "We're assuming you've set up your tools already and are all ready to go."

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git wget rsync tree lynx node
npm install npm@latest -g
brew cask install virtualbox
brew cask install vagrant
brew cask install vagrant-manager
vagrant plugin install vagrant-ghost
vagrant plugin install vagrant-hostsupdater