pkgname=$(config pkgname)
su - builder -c "cd /home/builder/raku-packages/$pkg_name && abuild checksum && abuild -r"
