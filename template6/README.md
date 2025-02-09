# template6

Templater based on Raku Template6 module

# Install

    s6 --install template6

# Usage

```

my %state = task-run "deploy server config", "template6", %(
 vars => %(
  :80port,
  :use_tls,
  :database_name<Products>,
 ),
 :target</etc/server.conf>,
 :template_dir<server_templates>,
 :template<server_config>,
 :dry_run, 
);

say %state<status>;

# 1 - target first time created
# 0 - target has not changed
# 2 - target has changed

```

# Parameters

## template_dir

Template directory. Optional, default value `templates/`

## template

Template name (without `tt` extension). Optional. Default value `config`

## target

Target file. Optional. Default value `out.txt`

## vars

Template variable. Raku Hash. Optional

# dry_run

Dry run mode. Optional. Default value is `False`

# Author

Alexey Melezhik

# Links

[Template6](https://github.com/raku-community-modules/Template6)

