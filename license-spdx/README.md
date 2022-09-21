# license-spdx

Check License using License::SPDX

# Install

    s6 --install license-spdx

# Usage

```raku
  my $s = task-run "license check", "license-spdx", %(
    dir => ".",
  );

  say $s<license>; # license string
  say $s<status>; # license status - OK|FAIL|DEPRECATED
  say $s<message>; # short descriptive message

```
# Parameters

## dir

Directory with "META6.json" file. Optional. Default value is '.'


# Author

Alexey Melezhik
