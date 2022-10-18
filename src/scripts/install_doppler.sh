#!/bin/bash
set +e

# check if apt-get is present
if command -v apt-get &> /dev/null
then
  # install sudo
  apt-get install -y sudo
  ls -al /bin/sh && sudo rm /bin/sh && sudo ln -s /bin/bash /bin/sh && ls -al /bin/sh
fi

# Install gnupg if its not present
if ! command -v gpg &> /dev/null
then
  # install gnupg
  if command -v apt-get &> /dev/null
  then
    sudo apt-get install -y gnupg
  elif command -v brew &> /dev/null
  then
    HOMEBREW_NO_AUTO_UPDATE=1 brew install gnupg
  else
    echo "Please install gnupg before installing doppler. Unable to detect apt-get or homebrew"
    exit 1
  fi
fi

(curl -Ls --tlsv1.2 --proto "=https" --retry 3 https://cli.doppler.com/install.sh || wget -t 3 -qO- https://cli.doppler.com/install.sh) | sudo sh
doppler --version
