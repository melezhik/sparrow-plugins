# SYNOPSIS

simple monitporing for blog.perl.org

* get logged and check if your profile page is valid

# INSTALL

    sparrow plg install swat-blog-perl-org

# Usage

    sparrow project create blog-perl-org
    sparrow task add blog-perl-org my-account swat-blog-perl-org
    

Then you need to setup `username` and `password` variables.


    sparrow task ini blog-perl-org/my-account

    [account]

    username = melezhik
    password = *********

That's it! Now just run it:

    sparrow task run blog-perl-org/my-account

# Example Output

    /home/vagrant/.swat/.cache/10084/prove/login/00.GET.t ..
    ok 1 - POST http://blogs.perl.org//mt/mt-cp.fcgi succeeded
    # response saved to /home/vagrant/.swat/.cache/10084/prove/0V5rUUOr22
    ok 2 - output match '200 OK'
    ok 3 - output match 'Edit Profile'
    ok 4 - output match 'Display Name'
    ok 5 - output match 'Email Address'
    ok 6 - output match 'New Password'
    ok 7 - output match 'Confirm Password'
    ok 8 - response is already set
    # response saved to /home/vagrant/.swat/.cache/10084/prove/8Wa7ITURei
    ok 9 - output match 'OK'
    1..9
    ok
    /home/vagrant/.swat/.cache/10084/prove/00.GET.t ........
    ok 1 - GET http://blogs.perl.org// succeeded
    # response saved to /home/vagrant/.swat/.cache/10084/prove/DEt9FGcTHu
    ok 2 - output match 'blogs.perl.org'
    ok 3 - output match 'There's more than one way to blog it.'
    1..3
    ok
    All tests successful.
    Files=2, Tests=12, 15 wallclock secs ( 0.03 usr  0.00 sys +  0.12 cusr  0.04 csys =  0.19 CPU)
    Result: PASS
        
# AUTHOR

Alexey Melezhik


  
