zookeeper:
    source_url: 'http://www.us.apache.org/dist/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz'
    version: 3.4.6
    prefix: /usr/lib/zookeeper
    data_dir: /var/lib/zookeeper/data
    port: 2181
    uid: 6030
    bind_address: 0.0.0.0

    # Instance settings
    private_key_path: "/home/ubuntu/.ssh/storm-keypair.pem"
    private_key_name: "storm-keypair"
    security_group: "open"
    location: "us-east-1"
    availability_zone: "us-east-1d"