# sparkyci-tool-apkbuild

Build alpine package for Raku module distribution

# Install

    s6 --install sparkyci-tool-apkbuild

# Usage

    task-run "apk setup", "sparkyci-tool-apkbuild", %(
      action => "setup",
      pub_key => "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzfGPHUnYGEm28weCa6d5
                  qoM0lSHP+8fzkQGrwwQJEpyeAqxjeSBJUBFiTc+qNnF42nbGAH8FtxJnw5MfvaB2
                  iHMP8q0H2qiTfjGf1Ky+/3/Ile8kEWSDtFBpz2FibqHCwwQOtAn3GVmaPIHQg8aO
                  oA4KxGLVh9Mm/u13RSRR4qz+sRB/a/JgfaJGXnMJu47jQZdugZ9GItYzXoQzSRSn
                  tKf0LgAR463GG2TIKKgMJF440oYDUgTHkicHD+p8dIpR9jLW2KpS0BKpsKqiRNvp
                  ryimMf6SKpUzqWI8fBrfYXG5nCWwEkHxQAOn0n7PyaDkGSWUaOUeV0H9l6epOSfH
                  WwIDAQAB",
      prv_key => "keep it secret",
      keyname => "builder.rsa"
    );

    task-run "Cromtit package", "sparkyci-tool-apkbuild", %(
      action => "create",
      pkgname => "raku-Cromtit",
      pkgver => "0.0.8",
      pkgrel => 2,
      pkgdesc => "Run Tomtit scenarios as cron jobs and more.",
      source => "https://360.zef.pm/C/RO/CROMTIT/84b480156c520677f7360b9f9aac98e6d96939e9.tar.gz",
      url => "https://github.com/melezhik/Cromtit",
      builddir => 'dist',
      depends => "raku-Yamlish raku-Data-Dump",
      license => "Artistic-2.0",
    );

# Parameters

## action

Actual action to perform. One of three:

* `setup`

Set up Alpine packager tool-chain

* `create`

Create an Alpine package for Raku module

* `nginx`

Setup alpine repository and server it via nginx

## pkgname

Alpine package name. Required.

## pkgver

Alpine package version. Required.

## pkgrel

Alpine package release number. Required.

## source

Alpine package source. Required.

## source_extension

Source archive file extension. Optional. Default value is `tar.gz`.

## url

Package URL

## builddir

Directory inside the srcdir where the main package source is unpacked. Required.

## depends

Run-time dependency package(s). Optional.

## makedepends

Specifies build dependencies for the package. Optional.

## buildcommand

Optional build command to be run before packaging. For example:

```raku
buildcommand => "/usr/share/rakudo/vendor/bin/zef build ."
```

## license

License(s) for the package. Optional.

# readme

Readme file path. Optional. Default value is `README.md`.

## keyname

Public/Private key pair name. Optional. Default value is `builder.rsa`.

## pub_key

Public key. Optional.

## prv_key

Private key. Optional.

# Author

Alexey Melezhik
