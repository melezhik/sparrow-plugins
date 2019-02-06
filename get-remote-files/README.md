# SYNOPSIS

Outthentic plugin.

Download remote files via http(s). You can download up to 9 files.

# INSTALL

    $ sparrow plg install get-remote-files

# USAGE

## manually

    $ sparrow plg run get-remote-files 
    $ sparrow project create configuration
    $ sparrow task add configuration configs get-remote-files
    $ sparrow task ini configuration/configs
    # Vim config
     file1:
       target: https://raw.githubusercontent.com/Spigell/configs-vim/master/vimrc
       destination: /home/spigell/.vimrc
    # Bash config
      file2:
       make_backup: false
       target: https://raw.githubusercontent.com/Spigell/configs-bash/master/bashrc
       destination: /home/spigell/.bashrc
       ....
       file9:
       target: ...
       destinaton: ...


    $ sparrow task run configuration/configs

## via Sparrowdo
    
    $ cat sparrowfile
    task-run "test", 'get-remote-files', %(
      target      => 'https://sparrowhub.org/plugins/get-remote-files-v1.000001.tar.gz',
      destination => "/tmp/test.tar.gz",
      make_backup => 'true'
    );
 
    task-run 'some configs', 'get-remote-files', %(
      file1 => %(
        target      => "https://raw.githubusercontent.com/Spigell/configs-vim/ master/vimrc",
        destination => "/home/spigell/.vimrc"
      ),
      file2 => %(
        target      => "https://raw.githubusercontent.com/Spigell/configs-git/ master/gitconfig",
        destination => "/home/spigell/.gitconfig"
      ),
      file3 => %(
        target      => "https://raw.githubusercontent.com/Spigell/configs-bash/master/bashrc",
        destination => "/home/spigell/.bashrc"
      ),
    );

 

# Parameters

## File section:

### target

URL. Obligatory.
  
### destination

Path to file on local machine. Obligatory.

### make_backup

Create backup of file on local machine if it exists.
One of two: true|false. Default value is `false`.

# See also
[sparrowdo](https://github.com/melezhik/sparrowdo)

[sparrow](https://github.com/melezhik/sparrow)
