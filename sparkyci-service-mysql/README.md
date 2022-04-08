# sparkyci-service-mysql

Installs mysql service on sparkyci

# Install

      s6 --install sparkyci-service-mysql

# Usage

Raku

      task-run "mysql", "sparkyci-service-mysql";

After task is complete, mysql service will be started with test database:

* db name - sparky

* db host - 127.0.0.1

* db user - sparky

* db password - sparky


# Author

Alexey Melezhik
