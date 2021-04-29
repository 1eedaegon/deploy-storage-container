#!/bin/bash

######## UNEXPECTED BAD THINGS WILL HAPPEN, IF YOU DON'T READ THIS #########
# Must be *terminate docker app before start this scripts

# REMOVE Server-client agent
rm -rf ~/Library/Containers/com.docker.*

# REMOVE docker process forceful
sudo pkill docker

# GET docker process 
ps -ef | grep docker


# MAY REMAIN PROCESS LIST: 
# com.docker.driver.amd64-linux
# com.docker.hyperkit (MAC) 
