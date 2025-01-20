my $cfg-orig = config()<path>.IO.slurp();

my $cfg = $cfg-orig;

for config()<enable><> -> $f {
   $cfg ~~ s/^^ <?wb> "$f=" \S+  <?wb> $$/$f=true/;
}

for config()<disable><> -> $f {
   $cfg ~~ s/^^ <?wb> "$f=" \S+ <?wb> $$/$f=false/;
}


set_stdout($cfg);

if $cfg ne $cfg-orig {
   set_stdout("config changed");
   run_task "service_restart", %(
       :service<app>,
   );
}
