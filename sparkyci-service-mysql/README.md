# sparkyci-service-mysql

Installs mysql service on sparkyci

# Install

      s6 --install sparkyci-service-mysql

# Usage

Raku

      task-run "mysql", "sparkyci-service-mysql";

After task is complete, mysql service will be started with test database:

* db host - localhost

* db name - sparky

* db user - sparky

* db password - sparky


# Author

Alexey Melezhik
