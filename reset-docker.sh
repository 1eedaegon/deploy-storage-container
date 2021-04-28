#!/bin/bash

rm -rf ~/Library/Containers/com.docker.*
sudo pkill docker
ps -ef | grep docker
