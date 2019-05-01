# SYNOPSIS

outthentic smoke tests for opscode mysql cookbook


# Check list

* verifies that select User,Host from mysql.user return valid data

* verifies that simple CRUD operations work 

    * create,delete database 
    * create table
    * insert into table
    * select from table

# Sample Output

    /tmp/.outthentic/14686/root/sparrow/plugins/public/outth-mysql-cookbook/mysql_user_select/task.t .. 
    
    ok 1 - stdout is already set
    
    ok 2 - stdout saved to /tmp/.outthentic/14686/EfoyVGcntN
    
    ok 3 - [b] output match 'SELECT Host,User FROM user WHERE User='root' AND Host='127.0.0.1''
    
    ok 4 - [b] output match 'Host : 127.0.0.1 User: root'
    
    ok 5 - [b] output match 'SELECT Host,User FROM user WHERE User='root' AND Host='localhost''
    
    ok 6 - [b] output match 'Host : localhost User: root'
    
    1..6
    
    ok
    
    /tmp/.outthentic/14686/root/sparrow/plugins/public/outth-mysql-cookbook/simple-crud/task.t ........ 
    
    ok 1 - stdout is already set
    
    ok 2 - stdout saved to /tmp/.outthentic/14686/Sig0rIX48S
    
    ok 3 - [b] output match 'create database foo'
    
    ok 4 - [b] output match 'Affected row: 1'
    
    ok 5 - [b] output match 'create table foo.bar (name text)'
    
    ok 6 - [b] output match 'Affected row: 0'
    
    ok 7 - [b] output match 'insert into foo.bar (name) values ('alexey')'
    
    ok 8 - [b] output match 'Affected row: 1'
    
    ok 9 - [b] output match 'SELECT name from foo.bar'
    
    ok 10 - [b] output match 'Name : alexey'
    
    1..10
    
    ok
    
    All tests successful.
    
    Files=2, Tests=16,  0 wallclock secs ( 0.01 usr  0.00 sys +  0.08 cusr  0.00 csys =  0.09 CPU)
    
    Result: PASS
    

# Author

Alexey Melezhik
    
