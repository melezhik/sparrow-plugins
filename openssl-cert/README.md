# openssl-cert

Create self signed SSL cert using openssl client

# Install

    s6 --install openssl-cert

# Usage

    my %state = task-run "create", "openssl-cert", %(
      CN => "www.example.com"
    );

    say %state<key>; # private key
    say %state<cert>; # certificate

# Parameters

## CN

CN certificate part

# Output

## key

certificate key 

## cert

certificate

# Author

Alexey Melezhik

