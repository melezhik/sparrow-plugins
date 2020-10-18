# SYNOPSIS

Wrapper for [tflint](https://github.com/terraform-linters/tflint)

# INSTALL

    $ s6 --install tflint

# USAGE

    task-run "lint my code", "tflint", %(
      args => [
        ".",
        ["force", "no-color"]
      ]
    );

# Args

See [tflint](https://github.com/terraform-linters/tflint) documentation.

# Author

Alexey Melezhik

