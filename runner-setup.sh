#!/bin/bash
# This shows you how to set up a custom GitHub runner, preferrably in a LXC container.
# Preferred Distribustion: devuan
# Preferred Release: daedalus

# Install base dependencies
apt-get update
apt-get -y install wget curl nano jq procps

# Install Golang
GO_V=1.23.10
wget -O /tmp/golang.tar.gz https://go.dev/dl/go$GO_V.linux-amd64.tar.gz
tar -C /tmp/ -xf /tmp/golang.tar.gz
mv /tmp/go /opt/golang
PATH=$PATH:/opt/golang/bin

# Create necessary directories and download and extract GitHub Runner
GH_RUNNER_V=2.328.0
mkdir -p /root/runner/mos-moby /root/runner_workdir/mos-moby
cd /root/runner/mos-moby
curl -o actions-runner-linux-x64-${GH_RUNNER_V}.tar.gz -L https://github.com/actions/runner/releases/download/v${GH_RUNNER_V}/actions-runner-linux-x64-${GH_RUNNER_V}.tar.gz
tar xzf ./actions-runner-linux-x64-${GH_RUNNER_V}.tar.gz
rm -f actions-runner-linux-x64-${GH_RUNNER_V}.tar.gz

# Make sure to replace <YOURTOKEN> with the runner token from GitHub
./config.sh --url https://github.com/ich777/mos-moby --token <YOURTOKENHERE>

# At this stage finish the configuration for the Runner and point the workdir to:
# /root/runner_workdir/mos-moby

# Copy over runner-mos_moby to /etc/init.d/ and make sure it's executable
echo "/etc/init.d/runner-mos_moby start"  >> /etc/rc.local

# Reboot the LXC container
# Done
