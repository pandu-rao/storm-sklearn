git:
  pkg.installed

repository:
  git.latest:
    - name: {{ pillar['git']['repo'] }}
    - target: /home/ubuntu/storm-sklearn
    - rev: master
    - force_checkout: True
    - user: ubuntu
    - require:
      - pkg: git

# Salt cloud
python-pip:
  pkg.installed

apache-libcloud:
  pip.installed:
    - upgrade: True
    - require:
      - pkg: python-pip

requests:
  pip.installed:
    - upgrade: True
    - require:
      - pkg: python-pip

/etc/salt/cloud.providers:
  file.managed:
    - source: salt://salt-master/files/cloud.providers
    - user: root
    - template: jinja

/etc/salt/cloud.profiles:
  file.managed:
    - source: salt://salt-master/files/cloud.profiles
    - user: root
    - template: jinja

/usr/local/bin/lein:
  file.managed:
    - source: salt://salt-master/files/lein
    - user: root
    - group: root
    - mode: 755

default-jdk:
  pkg.installed

install-lein:
  cmd.run:
    - name: sudo -u ubuntu /usr/local/bin/lein
    - env:
      LEIN_ROOT: 1
    - require:
      - pkg: default-jdk

sklearn-packages:
  pkg.installed:
    - pkgs:
      - mg
      - nmap
      - gcc
      - g++
      - python-dev
      - virtualenvwrapper

sklearn-virtualenv:
  cmd.run:
    - name: 'su - ubuntu -c "bash -l -i -c \". /etc/bash_completion.d/virtualenvwrapper && mkvirtualenv sklearn && workon sklearn && pip install -r ~/storm-sklearn/requirements.txt\""'
    - onlyif: test -f /etc/bash_completion.d/virtualenvwrapper
    - unless: test -d /home/ubuntu/.virtualenvs/sklearn
