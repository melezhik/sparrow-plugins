# SYNOPSIS

Get and print variable group in convenient way.

# INSTALL

    $ s6 --install ado-read-variable-groups

# USAGE

    task-run "read my vars", "ado-read-variable-groups", %(
      organization => "CompanyX",
      project => "CoolKids"
      group_id => 1234,
      user  => "buddy",
      token => "paSworRdd"
    );

# Sample Output

    20:01:15 05/03/2019 [read my vars] ================[ TestGroup] =================
    20:01:15 05/03/2019 [read my vars] +-------------+---------------+
    20:01:15 05/03/2019 [read my vars] | name        | value         |
    20:01:15 05/03/2019 [read my vars] O=============O===============O
    20:01:15 05/03/2019 [read my vars] | email       | mail@mail.org |
    20:01:15 05/03/2019 [read my vars] +-------------+---------------+
    20:01:15 05/03/2019 [read my vars] | environment | dev           |
    20:01:15 05/03/2019 [read my vars] +-------------+---------------+
    20:01:15 05/03/2019 [read my vars] | login       | admin         |
    20:01:15 05/03/2019 [read my vars] +-------------+---------------+
    20:01:15 05/03/2019 [read my vars] | name        | Alexey        |
    20:01:16 05/03/2019 [read my vars] +-------------+---------------+
    20:01:16 05/03/2019 [read my vars] | password    | qwerty        |
    20:01:16 05/03/2019 [read my vars] +-------------+---------------+
    20:01:16 05/03/2019 [read my vars] | product_id  | 1002          |
    20:01:16 05/03/2019 [read my vars] +-------------+---------------+

# State

Returns a list of variables, if you need to handle the one programmatically

    my %state = task-run "read my vars", "ado-read-variable-groups", %(
      organization => "CompanyX",
      project => "CoolKids"
      group_id => 1234,
      user  => "buddy",
      token => "paSworRdd"
    );
  
    for %state<list><> -> $i {
    
      say "{$i<name>} = {$i<value>}";
    
    }
    

Output:

    email = mail@mail.org
    environment = dev
    login = admin
    name = Alexey
    password = qwerty
    product_id = 1002
        

# Parameters

## organization

Ado organization

## project

Ado project

## group_id

  Group Variable ID

## user

Ado user, used for authentication

## only

Only load given list of variables, for example:

  only => ( 'login', 'password' )

## token

Ado token, used for authentication

## debug

Enable debug mode to print http request data

# Requirements

curl

# Author

Alexey Melezhik

