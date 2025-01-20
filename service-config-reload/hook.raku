#!raku

my $cfg-orig = config()<path>.IO.slurp();

my $cfg = $cfg-orig;

for config()<enable><> -> $f {
   $cfg ~~ s/<?wb> "$f=" \S+ /$f=true/;
}

for config()<disable><> -> $f {
   $cfg ~~ s/<?wb> "$f=" \S+ /$f=false/;
}

set_stdout($cfg);

if $cfg ne $cfg-orig {
   set_stdout("config changed");
   config()<path>.IO.spurt($cfg);
   run_task "service_restart", %(
       service => config()<service>,
       path => config()<path>,
   );
}
