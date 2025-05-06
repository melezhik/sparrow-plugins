# SYNOPSIS

Update aws lambda function configuration

# Platforms supported

* Any Linux

# INSTALL

```
s6 --install aws-configure-function
```

# API

The plugin uses [args stringification](https://github.com/melezhik/Sparrow6/blob/master/documentation/development.md#args-stringification)
mechanism to convert Raku data into command line parameters, so one could write something like that:
s
    task-run "configure aws lambda", "aws-configure-function", %(
      args => [
        %(
          function-name  => "my-function",
          memory-size => "256",
        )
      ]
    );

# Parameters

See parameters description at `aws lambda update-function-configuration` documentation pages

# Dependencies

aws cli

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)

# See also

[aws lambda update-function-configuration](https://docs.aws.amazon.com/cli/latest/reference/lambda/update-function-configuration.html)
