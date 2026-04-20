# lc4

Generate likec4 diagrams

# Install

```bash
s6 --install lc4
```
# API

Model:

```raku
file-delete "model.c4";

task-run "model", "lc4", %(
  :type<system>,
  :id<bsys>,
  :desc("Billing System"),
);

task-run "model", "lc4", %(
  :type<system>,
  :id<api>,
  :desc("API Server"),
  :parent<bsys>,
);

task-run "model", "lc4", %(
  :type<component>,
  :id<db>,
  :desc("Database"),
  :parent<api>,
);

task-run "model", "lc4", %(
  :type<system>,
  :id<bs_clients>,
  :desc("Billing clients"),
  :multiple,
);

# links

task-run "model", "lc4", %(
  :type<link>,
  :id("bs_clients:api"),
  :desc("Get buills"),
);

# views

task-run "model", "lc4", %(
  :type<view>,
  :id<bs-system-context>,
  :system<product_tree>,
  :parent<views>,
  :desc("Billing System. System context"),
);

task-run "model", "lc4", %(
  :type<view>,
  :id<bs-container-context>,
  :system<product_tree>,
  :parent<views>,
  :desc("Billing System. Container context"),
);

# includes

for qw<bs bs_clients> -> $id {
  task-run "model", "lc4", %(
    :type<include>,
    :parent<bs-system-context>,
    :$id,
  );
}
```

Deployment:


```raku

file-delete "deployment.c4";

# envs

task-run "deployment", "lc4", %(
  :type<environment>,
  :id<bs_kubernetes>,
  :desc<Kubernetes>,
  :parent<deployment>,
  :deployment,
);


task-run "deployment", "lc4", %(
  :type<environment>,
  :id<namespace>,
  :desc("Kubernetes Namespace"),
  :long_desc("Billing System k8s resources"),
  :parent<bs_kubernetes>,
  :deployment,
);

task-run "deployment", "lc4", %(
  :type<environment>,
  :id<bs_clients>,
  :desc("Billing System Clients"),
  :parent<deployment>,
  :deployment,
);


task-run "deployment", "lc4", %(
  :type<instance_of>,
  :id<clients:bs_clients>,
  :parent<bs_clients>,
  :deployment,
);

task-run "deployment", "lc4", %(
  :type<link>,
  :id<clients:api>,
  :proto<https>,
  :desc("Каталог дерева продуктов"),
  :parent<deployment>,
  :deployment,
);

# views

task-run ".",%(
  :type<view>,
  :id<bsys-deployment-production>,
  :parent<views>,
  :desc("Billing System. Production Deployment"),
  :deployment,
);

# includes

for qw<bs_kubernetes bs_kubernetes.* bs_clients bs_clients.*> -> $id {
  task-run "deployment", "lc4", %(
    :type<include>,
    :parent<bsys-deployment-production>,
    :$id,
    :deployment,
  );
}

```

# Author

Alexey Melezhik

