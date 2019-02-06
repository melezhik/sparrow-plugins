# SYNOPSIS

[swat](https://github.com/melezhik/swat) black box testing for yars restapi


# INSTALL

   $ sparrow plg install swat-yars

# USAGE
   
   $ yars start

   $ sparrow plg run swat-yars

   $ yars stop

# a sample output

   vagrant@Debian-jessie-amd64-netboot:~/my/swat-yars$ swat
   /home/vagrant/.swat/.cache/7528/prove/GET/request.t ......................
   ok 1 - 200 / 1 of 1 curl -X GET -k --connect-timeout 20 -m 20 -L -D - 'localhost:9001/'
   ok 2 - output match '200 OK'
   ok 3 - output match 'welcome to Yars'
   1..3
   ok
   /home/vagrant/.swat/.cache/7528/prove/status/GET/request.t ...............
   ok 1 - 200 / 1 of 1 curl -X GET -k --connect-timeout 20 -m 20 -L -D - 'localhost:9001/status'
   ok 2 - output match '200 OK'
   ok 3 - output match /{.*}/
   ok 4 - '{"server_url":"http://localhost:9001","s' match /"server_version":"(\S+?)"/
   ok 5 - server_version not null: 1.15
   1..5
   ok
   /home/vagrant/.swat/.cache/7528/prove/virtual/upload-file/GET/request.t ..
   ok 1 - 200 / 1 of 1 curl -X DELETE -k --connect-timeout 20 -m 20 -L -D - 'localhost:9001/file/test_file1/cb54dd2ea05ec90327464b40d27c0d55'
   ok 2 - output match /(200 OK|404 Not Found)/
   ok 3 - 201 / 1 of 1 curl -X PUT -k --connect-timeout 20 -m 20 -T /home/vagrant/my/swat-yars/file/test_file1/test_file1 -L -D - 'localhost:9001/file/test_file1/cb54dd2ea05ec90327464b40d27c0d55'
   ok 4 - output match '201 Created'
   ok 5 - [b] output match ':blank_line'
   ok 6 - [b] output match /^ok/
   ok 7 - 200 / 1 of 1 curl -X GET -k --connect-timeout 20 -m 20 -L -D - 'localhost:9001/file/test_file1/cb54dd2ea05ec90327464b40d27c0d55'
   ok 8 - output match '200 OK'
   ok 9 - output match 'HELLO WORLD'
   ok 10 - server response is spoofed
   # response saved to /home/vagrant/.swat/.cache/7528/prove/XJiHmhAvL4
   ok 11 - output match 'done'
   1..11
   ok
   All tests successful.
   Files=3, Tests=19,  1 wallclock secs ( 0.03 usr  0.00 sys +  0.17 cusr  0.02 csys =  0.22 CPU)
   Result: PASS
   
# Author

Alexey Melezhik

# See Also

* [https://github.com/melezhik/swat](https://github.com/melezhik/swat)
