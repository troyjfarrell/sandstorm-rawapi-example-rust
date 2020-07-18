#!/bin/bash

# When you change this file, you must take manual action. Read this doc:
# - https://docs.sandstorm.io/en/latest/vagrant-spk/customizing/#setupsh

set -euo pipefail

export DEBIAN_FRONTEND=noninteractive
apt-get update

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rustup-init.sh
# sudo, because this runs as root.
sudo -u vagrant /bin/sh /home/vagrant/rustup-init.sh -y

# Install Cap'n Proto
curl --proto '=https' --tlsv1.2 -sSf -O https://capnproto.org/capnproto-c++-0.8.0.tar.gz
tar zxf capnproto-c++-0.8.0.tar.gz
cd capnproto-c++-0.8.0
./configure
make -j6 check
make install

exit 0
