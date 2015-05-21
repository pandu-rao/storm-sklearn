#!/bin/bash

add-apt-repository ppa:saltstack/salt
apt-get -yqq update && apt-get -yqq upgrade
apt-get -yqq install mg git nmap
apt-get -yqq install gcc g++
apt-get -yqq install python-dev virtualenvwrapper
apt-get -yqq install salt-cloud

# Clone repo
su ubuntu <<'EOF'
cd ~
git clone https://github.com/pandu-rao/storm-sklearn.git
exit 0
EOF

# Master config
bash -c 'cat <<EOF > /etc/salt/master
auto_accept: True

file_roots:
  base:
    - /home/ubuntu/storm-sklearn/salt/salt

pillar_roots:
  base:
    - /home/ubuntu/storm-sklearn/salt/pillar
EOF'

# Minion config
bash -c 'cat <<EOF > /etc/salt/minion
master: localhost
id: salt-master
EOF'

service salt-minion restart
service salt-master restart
