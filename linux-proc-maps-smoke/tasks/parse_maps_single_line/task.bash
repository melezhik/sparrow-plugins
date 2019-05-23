perl -e '
use Linux::Proc::Maps qw(parse_maps_single_line);

print parse_maps_single_line("08048000-08056000 r-xp 00000000 03:0c 64593   /usr/sbin/gpm")->{pathname},"\n";
print parse_maps_single_line("08048000-08056000 r-xp 00000000 03:0c 64593   /usr/sbin/gpm")->{inode},"\n";
print parse_maps_single_line("08048000-08056000 r-xp 00000000 03:0c 64593   /usr/sbin/gpm")->{device},"\n";
print parse_maps_single_line("08048000-08056000 r-xp 00000000 03:0c 64593   /usr/sbin/gpm")->{offset},"\n"
';
