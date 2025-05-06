# SYNOPSIS

Update aws lambda function code

# Platforms supported

* Any Linux

# INSTALL

```
s6 --install aws-update-function
```

# Usage

The plugin uses [args stringification](https://github.com/melezhik/Sparrow6/blob/master/documentation/development.md#args-stringification)
mechanism to convert Raku data into command line parameters, so one could write something like that:

```
task-run "update aws lambda", "aws-update-function", %(
  args => [
    %( 
      function-name  => "my-function",
      zip-file => "fileb://my-function.zip",
    )
  ]
);

# dry-run mode
task-run "update aws lambda", "aws-update-function", %(
  args => [
    %( 
      function-name  => "my-function",
      zip-file => "fileb://my-function.zip",
    ),
    [ "dry-run" ]
  ]
);
```

# Parameters

See parameters description at `aws lambda update-function-code` documentation pages

# Dependencies

aws cli

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)

# See also

[aws lambda update-function-code](https://docs.aws.amazon.com/cli/latest/reference/lambda/update-function-code.html)
