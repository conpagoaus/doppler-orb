#!/bin/bash
set +e

# check if apt-get is present
if command -v apt-get &> /dev/null
then
  # install sudo
  apt-get install -y sudo
  ls -al /bin/sh && sudo rm /bin/sh && sudo ln -s /bin/bash /bin/sh && ls -al /bin/sh
fi

(curl -Ls --tlsv1.2 --proto "=https" --retry 3 https://cli.doppler.com/install.sh || wget -t 3 -qO- https://cli.doppler.com/install.sh) | sudo sh
doppler --version
