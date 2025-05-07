# SYNOPSIS

Create aws lambda function

# Platforms supported

* Any Linux

# INSTALL

```
s6 --install aws-create-function
```

# RUN

Cli

````
s6 --plg-run aws-create-function@role=arn:aws:iam::654173224926:role/lambda-ex,zip_file=/tmp/function.zip
```

Raku

```
task-run "create aws lambda", "aws-create-function", %(
  role => "arn:aws:iam::654173224926:role/lambda-ex",
  zip_file => "/path/to/file.zip"
);
```

# Parameters

See parameters description at `aws lambda create-function` documentation pages

* `function_name`

Optional

* `zip_file`

Optional

* `role`

Required

* `runtime`

Optional

# Dependencies

aws cli

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)

# See also

[aws lambda create-function](https://docs.aws.amazon.com/cli/latest/reference/lambda/create-function.html)
