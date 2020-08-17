# SYNOPSIS

Delete aws lambda function

# Platforms supported

* Any Linux

# INSTALL

    $ s6 --install aws-delete-function

# RUN

DSL. The plugin uses [args stringification](https://github.com/melezhik/Sparrow6/blob/master/documentation/development.md#args-stringification)
mechanism to convert Raku data into command line parameters, so one could write something like that:

    task-run "delete aws lambda", "aws-delete-function", %(
      args => [
        %(
          function-name  => "my-function"
        )
      ]
    );

# Parameters

See parameters description at `aws lambda delete-function` documentation pages

# Dependencies

aws cli

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)

# See also

[aws lambda delete-function](https://docs.aws.amazon.com/cli/latest/reference/lambda/delete-function.html)
