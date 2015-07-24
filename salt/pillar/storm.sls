storm:
  source_url: http://mirror.reverse.net/pub/apache/storm/apache-storm-0.9.4/apache-storm-0.9.4.tar.gz
  version_name: apache-storm-0.9.4
  home: /usr/lib/storm
  data_dir: /var/lib/storm/data
  dl_opts: -L

  # Instance settings
  private_key_path: "/home/ubuntu/.ssh/storm-keypair.pem"
  private_key_name: "storm-keypair"
  location: "ap-southeast-1"
  availability_zone: "ap-southeast-1a"
