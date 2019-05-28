# SYNOPSIS

Retrieve Ambari cluster hosts/ips information.

# INSTALL

    $ s6 --install ambari-hosts

# USAGE

    my %state = task-run "worker nodes", "ambari-hosts", %(
      ambari_host  => 'cluster.fqdn.host',
      admin => 'super-jack',
      password => 'PaSsWord123',
      cluster => "cluster01",
      node_type => "worker",
    );



    for %state<list><> -> $i {
      say "{$i<hostname>} => {$i<ip>}";
    }

Output:

    wn.foo.bar.1 => 10.71.101.1
    wn.foo.bar.2 => 10.71.101.2
    wn.foo.bar.3 => 10.71.101.3
    wn.foo.bar.4 => 10.71.100.1


# Parameters

## ambari_host

Ambari host fqdn

## admin

Ambari admin login

## password

Ambari admin password

## cluster

Ambari cluster name

## node_type

    worker|zoo_keeper|head

If not set, return all the nodes

# Requirements

curl

# Author

Alexey Melezhik

