perl -e '
use Linux::Proc::Maps qw(format_maps_single_line);
print format_maps_single_line({
    address_start   => 134512640,
    address_end     => 134569984,
    read            => 1,
    write           => "",
    execute         => 1,
    shared          => "",
    offset          => 0,
    device          => "03:0c",
    inode           => "64593",
    pathname        => "/usr/sbin/gpm",
})';
