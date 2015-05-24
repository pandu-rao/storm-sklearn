#!/bin/bash

add-apt-repository -y ppa:saltstack/salt;
apt-add-repository -y ppa:webupd8team/java;
apt-get -yqq update && apt-get -yqq upgrade;
apt-get -yqq install mg git nmap;
apt-get -yqq install gcc g++;
apt-get -yqq install python-dev virtualenvwrapper;
apt-get install oracle-java7-installer;

apt-get -yqq remove python-pip;
wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py;
python get-pip.py;
ln -s /usr/local/bin/pip /usr/bin/pip;

murl='http://www.gtlib.gatech.edu/pub/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz';
surl='http://psg.mtu.edu/pub/apache/storm/apache-storm-0.9.4/apache-storm-0.9.4.tar.gz';
mkdir ~/maven && wget "$murl" -O - | tar zxvf - -C maven --strip-components=1;
mkdir ~/storm && wget "$surl" -O - | tar zxvf - -C storm --strip-components=1;
echo 'export PATH=$PATH:~/maven/bin:~/storm/bin' >> ~/.bashrc;

apt-get -yqq install salt-cloud;
apt-get -yqq install salt-master salt-minion;

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
