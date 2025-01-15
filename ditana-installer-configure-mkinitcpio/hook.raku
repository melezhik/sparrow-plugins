#run_task "check";

my $path = config()<path>;

# echo 'Check if "udev" or "systemd" is in mkinitcpio HOOKS'

my $cfg = $path.IO.slurp();

#set_stdout($cfg);

my $udev_systemd_check = $cfg ~~ /^^ "HOOKS=" .* <?wb>  ("udev" || "systemd")  <?wb> / ??
True !! False;

set_stdout("udev_systemd_check $udev_systemd_check");

run_task "configure";
