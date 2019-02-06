# SYNOPSIS

[swat](https://github.com/melezhik/swat) smoke/integration tests for [httpd cookbook](https://github.com/chef-cookbooks/httpd)

# Check list

* `GET /` request should succeed
* checking if httpd footprint exists in server response

# Sample Output

    # running export swat_my=/root/sparrow/projects/foo/checkpoints/httpd/swat.my && cd /root/sparrow/plugins/public/swat-httpd-cookbook && carton exec 'swat ./ 127.0.0.1' ...
    
    /root/.swat/.cache/3397/prove/00.GET.t .. 
    
    ok 1 - GET 127.0.0.1/ succeeded
    
    # response saved to /root/.swat/.cache/3397/prove/kfgu01XMra
    
    ok 2 - output match '200 OK'
    
    ok 3 - output match /Server: Apache\/(\S+) (\S+)/
    
    ok 4 - server version: 2.2.22
    
    ok 5 - server OS footprint: (Debian)
    
    1..5
    
    ok
    
    All tests successful.
    
    Files=1, Tests=5,  0 wallclock secs ( 0.00 usr  0.01 sys +  0.03 cusr  0.00 csys =  0.04 CPU)
    
    Result: PASS
    

# ToDo

Optional checks:

* check if contact information present at server landing page
* check if server version found at footprint is equal to given

# AUTHOR

[Alexey Melezhik](mailto:melezhik@gmail.com)


