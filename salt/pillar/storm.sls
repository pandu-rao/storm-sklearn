storm:
  source_url: http://mirror.reverse.net/pub/apache/storm/apache-storm-0.9.4/apache-storm-0.9.4.tar.gz
  version_name: apache-storm-0.9.4
  home: /usr/lib/storm
  data_dir: /var/lib/storm/data
  dl_opts: -L

  # Instance settings
  private_key_path: "/home/ubuntu/.ssh/storm-keypair.pem"
  private_key_name: "storm-keypair"
  security_group: "open"
  location: "us-east-1"
  availability_zone: "us-east-1d"
