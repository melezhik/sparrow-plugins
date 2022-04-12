# sparkyci-service-mysql

Installs mysql (aka mariadb) service on sparkyci

# Install

    s6 --install sparkyci-service-mysql

# Usage

    task-run "mysql", "sparkyci-service-mysql";

After task is complete, mysql service will be started with test database:

* db host - localhost

* db name - sparky

* db user - sparky

* db password - sparky

# Configuration

To changes default values pass parameters:

    task-run "mysql", "sparkyci-service-mysql", %(
      db_name => "dbdishtest"
      db_user => "testuser",
      db_pass => "testpass",
    );

# Author

Alexey Melezhik
