# license-spdx

Check License using License::SPDX

# Install

    s6 --install license-spdx

# Usage

```raku
  my $s = task-run "license check", "license-spdx", %(
    dir => ".",
  );

  say $s<status>;
  say $s<message>;

```
# Author

Alexey Melezhik
