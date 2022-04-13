# sparkyci-service-postgresql

Installs postgresql service on sparkyci

# Install

    s6 --install sparkyci-service-postgresql

# Usage

    task-run "postgresql", "sparkyci-service-postgresql";

After task is complete, postgresql service will be started with test database:

* db host - localhost

* db name - sparky

* db user - sparky

* db password - sparky

# Configuration

To changes default values pass parameters:

    task-run "postgresql", "sparkyci-service-postgresql", %(
      db_name => "dbdishtest"
      db_user => "testuser",
      db_pass => "testpass",
    );

# Author

Alexey Melezhik
