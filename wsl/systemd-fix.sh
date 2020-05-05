#!/usr/bin/env bash

function Replace_Systemctl() {
  mv /usr/bin/systemctl /usr/bin/systemctl.old
  curl https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl.py > /usr/bin/systemctl
  chmod +x /usr/bin/systemctl
}

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
else
  Replace_Systemctl
fi