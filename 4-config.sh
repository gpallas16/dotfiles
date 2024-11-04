#!/bin/bash

## Add asdf plugins
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add java https://github.com/halcyon/asdf-java.git
asdf plugin add kotlin https://github.com/asdf-community/asdf-kotlin.git
asdf plugin add maven
asdf plugin add helm

# Read .tool-versions file and install the specified versions
cd ~
asdf install

echo "Configuring java..."
#. ~/.asdf/plugins/java/set-java-home.bash

echo "Modifying system for vite..."
# Check current limit
ulimit -Sn
# Change limit (temporary)
ulimit -Sn 10000 # You might need to change the hard limit too

# Check current limits
sysctl fs.inotify
# Change limits (temporary)
sudo sysctl fs.inotify.max_queued_events=16384
sudo sysctl fs.inotify.max_user_instances=8192
sudo sysctl fs.inotify.max_user_watches=524288

grep -qxF '* - nofile 65536' /etc/security/limits.conf || echo '* - nofile 65536' | sudo tee -a /etc/security/limits.conf
grep -qxF 'DefaultLimitNOFILE=65536' /etc/systemd/system.conf || echo 'DefaultLimitNOFILE=65536' | sudo tee -a /etc/systemd/system.conf
grep -qxF 'DefaultLimitNOFILE=65536' /etc/systemd/user.conf || echo 'DefaultLimitNOFILE=65536' | sudo tee -a /etc/systemd/user.conf

echo "Optimizing ssd..."
sudo systemctl enable fstrim.timer

#echo "Setting up docker..."
#ls -al /dev/kvm
#sudo usermod -aG kvm $USER
#sudo usermod -aG docker $USER
#docker --version
## .socket instead of .service to start docker deamon only when needed
#sudo systemctl enable --now docker.socket
#docker context use default
#docker compose version

echo "Configuring NodeJS..."
corepack enable pnpm
corepack enable yarn
asdf reshim nodejs
