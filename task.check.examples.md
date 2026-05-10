# task check
```
|frogs:[1] | max_frog_index:1 | holes_sum: 0 | N:3 | F:1 | cnt:0|
|frogs:[2, 4, 5] | max_frog_index:5 | holes_sum: 1 | N:6 | F:3 | cnt:0|

```

# task check
```
init done
```

# task check
```

```

# task check
```
```

# task check
```
install ok
```

# task check
```
begin:
sleep for awhile
sleep for awhile
tick ...
sleep for awhile
sleep for awhile
tick ...
sleep for awhile
sleep for awhile
tick ...
sleep for awhile
sleep for awhile
tick ...
sleep for awhile
sleep for awhile
tick ...
boom! ...
end:
```

# task check
```
```

# task check
```
ok Installed

```

# task check
```
autoremove-done
```

# task check
```
```

# task check
```
Status: install ok installed

```

# task check
```
a-sort1:[5 6 7 11 12 13]
a-sort2:[1 2 5 6 7 7 56]
a-sort3:[1 2 2 3 3 3 6 6 7 7 10]
```

# task check
```
regexp: 'file processed:' \s+ (\d+)

generator: <<CODE
!perl6

update_state %( file-processed => 0 );

if capture()[0] > 0 { 

  say "regexp: .* \\s+ '['  ( FAIL || OK ) ']'";
  update_state %( file-processed => capture()[0] );

}

CODE

generator: <<CODE
!perl6

  my $fail-cnt = 0;

  if get_state()<file-processed> {

    for captures()<> -> $c {

        $fail-cnt++ if $c[0][0] eq "FAIL";   
    }

    say "assert: ", $fail-cnt  ?? 0 !! 1 , " no failures found";

  }



CODE
```

# task check
```
```

# task check
```
# release 10.0

~regexp: \s+ "release" \s+ (\S+) \s

code: <<RAKU
!raku
if matched() {
  my $r = "{capture().head}";
  my @foo = $r.split(".");
  say "redhat version found: $r, major: {@foo.head}, minor: { @foo.tail || ''}";
  say "inline: rh_version=$r; rh_version_major={@foo.head}; rh_version_minor={ @foo.tail || ''};";
  update_state(%( version => $r, major => @foo.head, minor => @foo.tail || ""  ));
} else {
  update_state(%( version => "", major => "", minor => "" ));
}
RAKU



```

# task check
```
generator: <<RAKU
!perl6

if config()<image> {

  say "note: >>> check image";
  say "[image={config()<image>}]";

}

if config()<env> {

  say "note: >>> check env";
  say 'between: {"[env_start]"} {"[env_end]"}';

  if config<env>.isa(Array) {
    for config<env><> -> $i {
      say "regexp: ^^ '[' '$i' '=' .* ']' \$\$"
    }
  } else {
    my %h = config<env>;
    for %h -> $i {
      say "[{$i.key}={$i.value}]"
    }
  }

  say "end:";
}


if config()<volume-mounts> {
  say "note: >>> check volume mounts";
  say 'between: {"[volume_mounts_start]"} {"[volume_mounts_end]"}';
  if config<volume-mounts>.isa(Array) {
    for config<volume-mounts><> -> $i {
      say $i
    }
  } else {
    my %h = config<volume-mounts>;
    for %h -> $i {
      say "[{$i.key} {$i.value}]"
    }
  }
  say "end:";
}

if config()<command> {
  say "note: >>> check command";
  say "begin:";
  say "[command_start]";
  if config<command>.isa(Str) {
    say config<command>;
  } else {
    for config<command><> -> $i {
      say $i
    }
  }
  say "[command_end]";
  say "end:";
}

if config()<command-args> {
  say "note: >>> check command args";
  say "begin:";
  say "[command_args_start]";
  if config<command-args>.isa(Str) {
    say config<command-args>;
  } else {
    for config<command-args><> -> $i {
      say $i
    }
  }
  say "[command_args_end]";
  say "end:";
}

RAKU

```

# task check
```
generator: <<CODE
!perl6

  my $list = config()<exists>;
  if $list {
    for $list<>.sort -> $s {
      say "regexp: \\S+ '/secrets/$s'", ' \s+';
    }
  }

CODE
```

# task check
```
generator: <<CODE
!perl6

  my $list = config()<exists>;
  if $list {
    for $list<>.sort -> $s {
      say "regexp: \\S+ '/secrets/$s'", ' \s+';
    }
  }

CODE
```

# task check
```
code: <<CODE
!perl6
if "{cache_root_dir()}/mysql-need-restart.ok".IO ~~ :f {
  update_state %( restart => True );
  say "need to restart mysql";
} else {
  update_state %( restart => False )
}
CODE
```

# task check
```
here we go
s1=15, s2=40, sum=55

```

# task check
```
code: <<CODE
!perl
print "note: ", "checking if ".
        (task_var('user')).
        " is listed at group ".
        (config()->{sudo_group}).
        " on ".(task_var('server'))."... \n"
CODE

generator: <<CODE
!perl
if ( task_var('user') eq 'root' ) {
  print "assert: 1 qq{root has sudo access}\n";
}else {
  print "regexp: \\b".(config()->{sudo_group}).'\\b', "\n";
}
CODE
```

# task check
```
done

```

# task check
```
#notAfter=Jun 14 12:00:00 2018 GMT
regexp: notAfter=(.*)

generator: <<CODE
!perl
my $ds = capture()->[0]; # date string;

if ($ds=~/(\w+)\s+(\d+)\s+(\d\d):(\d\d):(\d\d)\s+(\d\d\d\d)/){

  #print "assert: 1 notAfter date is valid\n";

  use DateTime::Format::Strptime;
  use DateTime;
   
  my $strp = DateTime::Format::Strptime->new(
      pattern   => '%b %d %H:%M:%S %Y',
      #pattern => '%b %d %H:%M:%S %Y',
      locale    => 'en_US',
  );

  my $dt = $strp->parse_datetime( $ds || "May 29 12:00:00 2018 GMT");
  #my $dt = $strp->parse_datetime( "May 23 10:00:00 2018 GMT");
  my $ed = config()->{expiration_date};
  my $cert_lasts = (DateTime->compare($dt, DateTime->now->add( days =>  $ed )) == 1) ? 1 : 0;

  [ "assert: $cert_lasts certificate lasts for at least $ed days" ];

} else {
  #[ "assert: 0 expiration date is valid" ]
}
  
CODE
```

# task check
```
regexp: "HTTP/" \d+ '.' \d+ \s+ "200 OK"
```

# task check
```
bitbucket-repo-done
```

# task check
```
begin:
  === InOrder
  D
  B
  E
  A
  F
  C
  ===
end:
```

# task check
```
begin:
  === InOrder
  B
  A
  C
  D
  E
  ===
end:
```

# task check
```
begin:
  === InOrder
  D
  C
  B
  A
  ===
end:
```

# task check
```
use Kind from subtask OK
use MyModule from subtask OK
```

# task check
```
use Kind from bash OK
use MyModule from bash OK
```

# task check
```
regexp: STAT pid \d+
```

# task check
```
note: mariadb should be initialized
mariadb initialized

note: database should be created
regexp: "Can't create database 'test'; database exists" || "database created"

note: user should be created
regexp: "ERROR 1396" || "user created"

note: table should be created
regexp: "Table 'foo' already exists" || "table foo created"

note: select test
begin:
select_start
1
1
select_end
end:

note: insert test
begin:
insert_start
count(*)
1
insert_end
end:```

# task check
```
#Filesystem      Size  Used Avail Use% Mounted on
#/dev/sda1       9.2G  6.6G  2.2G  76% /
#udev             10M     0   10M   0% /dev
#tmpfs           971M  8.4M  963M   1% /run
#tmpfs           2.4G  4.0K  2.4G   1% /dev/shm
#tmpfs           5.0M     0  5.0M   0% /run/lock
#tmpfs           2.4G     0  2.4G   0% /sys/fs/cgroup
#none            119G  107G   12G  90% /vagrant
#none            119G  107G   12G  90% /home/vagrant/projects

note: validate disks capacity
 
~regexp: (\S+) \s+ (\S+) \s+ (\S+) \s+ (\S+) \s+ (\d+) \% \s+ (\S+)

generator: <<CODE
!raku

my $th = config()<threshold>; 
my $mnt_need = config()<mnt> || ""; 

say "note: check disks, mount: $mnt_need, threshold: $th"; 
my $err-cnt = 0;

for captures()<> -> $c {
    my $mnt = $c<>[5];
    my $usg = $c<>[4];
    if $mnt_need {
      $mnt eq $mnt_need or next;
    }
    my $ok = $usg <= $th;
    #say "note: ", $c.raku;
    if config()<fail-on-check> {
      say "assert: ", $ok, " enough disk space for {$mnt} (limit={$usg}%)";
    } else {
      if $ok {
        say "note: enough disk space for {$mnt} (limit={$usg}%)";
    } else {
        $err-cnt++;
        say "note: !!! disk space for {$mnt} exeeds limit={$usg}%";
      }
    }
}   

update_state({ :$err-cnt });
CODE

```

# task check
```
regexp: "current branch:" \s+ "refs/heads/" (\S+)

code: <<CODE
!perl6
update_state %( branch => capture()[0])
CODE
```

# task check
```
Status: install ok installed

```

# task check
```
nginx is running

```

# task check
```
Kelp Initialized!
```

# task check
```
generator: <<CODE
!bash
  footprint=$(config footprint)
  if test "${footprint}"; then
    echo 'within: ' "${footprint}"
    echo 'regexp: .*'
  fi
CODE

```

# task check
```
regexp: '"LastUpdateStatus":' \s+ '"Successful"'
```

# task check
```
begin:
What is the base currency: USD
What currency to exchange to: RUB
What is the amount being exchanged: 100
end:

begin:
=========================
| USD to RUB
regexp: \s+ 'Rate:' \s+ \d+ '.' \d+ \s* $$
| USD: 100
regexp: \s+ 'RUB:' \s+ \d+ '.' \d+ \s* $$
=========================
end:

```

# task check
```
begin:
What is the base currency: USD
What currency to exchange to: RUB
What is the amount being exchanged: 0
end:

begin:
=========================
| USD to RUB
regexp: \s+ 'Rate:' \s+ \d+ '.' \d+ \s* $$
| USD: 0
| RUB: 0
=========================
end:

```

# task check
```
note: mariadb should be initialized
mariadb initialized

note: database should be created
regexp: "Can't create database 'test'; database exists" || "database created"

note: user should be created
regexp: "ERROR 1396" || "user created"

note: table should be created
regexp: "Table 'foo' already exists" || "table foo created"

note: select test
begin:
select_start
1
1
select_end
end:

note: insert test
begin:
insert_start
count(*)
1
insert_end
end:```

# task check
```
note: check az version

begin:
===
regexp: ^^ "azure-cli" \s+ \S+ $$
```

# task check
```
regexp: "changed:" \s ("true"|"false")

code: <<RAKU
!raku
if matched() {
  my $u = capture().head;
  if "$u" eq "true" {
    update_state(%( :changed));
  } else {
    update_state(%( :!changed));
  }
}
RAKU
```

# task check
```
regexp: \.\.\.\s+(2|3)\d\d$
```

# task check
```
generator: <<CODE
!perl6

  my $list = config()<list> || ();

  say "note: ========================= [ check ] ========================== ";

  if $list {
    for $list<> -> $s {
      say  ($s ~~ /'@'/) ??  "regexp: ^^ '[$s]'" !! "regexp: ^^ '[' \\S+ '@' '$s' ']'" ;
    }
  }

CODE

```

# task check
```
regexp: ServicePrincipalNames\s+:\s+
```

# task check
```
[8 7 6 5 4 3 2 1 0]
```

# task check
```
regexp: target \s+ ( created || deleted )

generator: <<CODE

!bash
if ! test -z $(config content); then
  echo set target content    
fi

if ! test -z $(config owner); then
  echo set target owner    
fi

if ! test -z $(config group); then
  echo set target group    
fi

CODE


```

# task check
```
begin:
0
1
1
2
3
5
8
13
21
34
end:
```

# task check
```
2 0 1 3
```

# task check
```
Done.

generator: <<CODE
!bash

if test -f ~/perl5/perlbrew/etc/bashrc; then
  echo assert: 1 "file ~/perl5/perlbrew/etc/bashrc exists"
else
  echo assert: 0 "file ~/perl5/perlbrew/etc/bashrc exists"
fi

if grep  'source' ~/.bashrc | grep -q '~/perl5/perlbrew/etc/bashrc'; then
  echo assert: 1 ~/.bashrc has '"source ~/perl5/perlbrew/etc/bashrc" line'
else
  echo assert: 0 ~/.bashrc has '"source ~/perl5/perlbrew/etc/bashrc" line'
fi

CODE

```

# task check
```
```

# task check
```
~regexp: "group exists"

code: <<RAKU
!raku
update_state(%( exists => True)) if matched()
RAKU

~regexp: "group not exists"

code: <<RAKU
!raku
update_state(%( exists => False)) if matched()
RAKU
```

# task check
```
generator: <<CODE

  my $allow = config()->{allow};

  if ($allow){
    for my $r (@{$allow}){
      print "regexp: \\s+ '", $r->[0], "'", " \\s+ '", $r->[1], "'", '$$', " \n";
    }
  }

CODE
```

# task check
```
branch found

```

# task check
```
regexp: "HTTP/" \d "." \d \s+ "200 OK" \s* $$
```

# task check
```
[1, 2, 3, 4, 5, 6, 7]
```

# task check
```
[1, 2, 3, 4, 5, 6, 7]
```

# task check
```
[1, 2, 3, 4, 5, 6, 7]
```

# task check
```
begin:
X _ X
O _ X
_ _ O
end:
```

# task check
```
regexp: (Install of ruby.*complete|Already installed ruby)
```

# task check
```
```

# task check
```
regexp: goss\s+version\s+v

```

# task check
```
```

# task check
```
IMAGE:iVBORw0KGgoAAAANSUhEUgAAAQAAAAEACAIAAADTED8xAAACaUlEQVR42uzVMRGAAAzAwLSHf8tgAAf95QVkyVNvNRN50FWBl10V6ABa0AFIByAdgHQA0gFIByAdgHQA0gFIByAdgHQA0gFIByAdgHQA0gFIByAdgHQA0gFIByAdgHQA0gFIByAdgHQA0gFIByAdgHQA0gFIByAdgHQA0gFIByAdgHQA0gFIByAdgHQA0gFIByAdgHQA0gFIB6ADqEAHIB2AdADSAUgHIB2AdADSAUgHIB2AdADSAUgHIB2AdADSAUgHIB2AdADSAUgHIB2AdADSAUgHIB2AdADSAUgHIB2AdADSAUgHIB2AdADSAUgHIB2AdADSAUgHIB2AdADSAUgHIB2AdADSAUgHIB2AdAA6gBZ0ANIBSAcgHYB0ANIBSAcgHYB0ANIBSAcgHYB0ANIBSAcgHYB0ANIBSAcgHYB0ANIBSAcgHYB0ANIBSAcgHYB0ANIBSAcgHYB0ANIBSAcgHYB0ANIBSAcgHYB0ANIBSAcgHYB0ANIBSAcgHYB0ANIB6AAq0AFIByAdgHQA0gFIByAdgHQA0gFIByAdgHQA0gFIByAdgHQA0gFIByAdgHQA0gFIByAdgHQA0gFIByAdgHQA0gFIByAdgHQA0gFIByAdgHQA0gFIByAdgHQA0gFIByAdgHQA0gFIByAdgHQA0gFIByAdgA6gAh2AdADSAUgHIB2AdADSAUgHIB2AdADSAUgHIB2AdADSAUgHIB2AdADSAUgHIB2AdADSAUgHIB2AdADSAUgHIB2AdADSAUgHIB2AdADSAUgHIB2AdADSAUgHIB2AdADSAUgHIB2AdADyxy8AAP//YSoDD5pLB7MAAAAASUVORK5CYII=
```

# task check
```
note: validate config

between: {'>>>'}  {'<<<'}

  note: allow to boot on crypted disks
  regexp: ^^ \s* "GRUB_ENABLE_CRYPTODISK=" (<[y 1 true]>  | '"true"' | '"yes"' )

  note: never allow to enable os prober
  !regexp: ^^ \s* "GRUB_DISABLE_OS_PROBER=" (<[y 1 true]> | '"true"' | '"yes"' )

end:
```

# task check
```
bye sparrow
```

# task check
```
sparrow
```

# task check
```
generator: [ "hello ".(task_var('name')) ]
```

# task check
```
welcome page
```

# task check
```
generator:<<CODE
  my $required_settings = config()->{required_settings} || ();
  #use Data::Dumper;
  #warn Dumper($required_settings);

  if (ref $required_settings){
    print  join "\n", map {"[$_]"} @{$required_settings}
  } else {
    print  join "\n", map {"[$_]"} split "/", $required_settings
  }
CODE
```

# task check
```
regexp: ProvisioningState\s+:\s+Succeeded
```

# task check
```
```

# task check
```
```

# task check
```
```

# task check
```
regexp: (\d+) \s+ (.*) \s+ (\S+)

generator: <<CODE
!perl

use ValidateEtime;
  
if ( config()->{validate_etime} ) {
  my @data = @{capture()};
  print "note: etime check\n"; 
  print "note: pid=$data[0], cmd=$data[1], tm=$data[2]\n"; 
  validate_nginx_etime(
    @data, 
    config()->{hitask}
  )
}

CODE

```

# task check
```

nginx: master
nginx: worker


```

# task check
```
[1, 2, 4]
```

# task check
```
regexp: '"State":' \s+ '"Active"'  || 'Function already exist'
```

# task check
```
resource exists

generator: <<RAKU
!perl6

if config()<data> {
  say "note: >>> check data";
  say 'between: {"[data_start]"} {"[data_end]"}';
  if config<data>.isa(Array) {
    for config<data><> -> $i {
      say $i
    }
  } else {
    my %h = config<data>;
    for %h -> $i {
      say "[{$i.key}={$i.value}]"
    }
  }
  say "end:";
}

RAKU

```

# task check
```
regexp: lines count: (\d+)
code: our $LINES_CNT = capture()->[0];
code: note "hitask: ".(config()->{logdog}->{hitask})
code: note "filter: ".(config()->{logdog}->{filter})
code: note "density: ".(config()->{logdog}->{density})

generator:  <<HERE
!perl
our $LINES_CNT; 
my $list = [];  

if (our $LINES_CNT>0){ 

    push @$list, (  
      'between: line_start line_end', 
      'regexp: '.(config()->{logdog}->{filter}), 
    ); 
} 

$list

HERE

code: <<HERE
!perl

our $grp_found = 0; 

if ( our $LINES_CNT > 0 ) {                  

  
        #note explain stream();              
        my %groups;                          
        my $i = 0;                           
        for my $s (@{stream()}) {            
            $i++;                            
            for my $i (@{$s}){                            
              my $patt = config()->{logdog}->{key_field}; 
              my $re = qr/$patt/;                         
              my @chunks = $i=~$re;             
              if (scalar @chunks){              
                  my $key = join ' ', @chunks;  
                  $groups{$key}->{cnt}++;       
                  push @{$groups{$key}->{lines}}, $i;    
               }                                      
            }                                                                       
        }                                                                           

      use Term::ANSIColor; 

      for my $g (grep { $groups{$_}->{cnt} >= (config()->{logdog}->{density} || 1) } keys %groups) {            
        print "note: ", colored( ['blue' ], "group $g count: $groups{$g}->{cnt}");         
        print "note: ", join "\n", map { colored(['green'],$_), } @{$groups{$g}->{lines}}; 
        $grp_found++; 
      }                                                                         
}

HERE

generator: <<HERE
!perl

our $grp_found;

my $check_mode = config()->{logdog}->{check_mode} || 'report'; 

if ($check_mode eq 'one_or_many' ){
    my $c = $grp_found > 0 ? 1 : 0;     
    print "assert: ", $c, "one or many groups found \n";
}elsif($check_mode eq 'zero'){ 
    my $c = $grp_found == 0 ? 1 : 0;     
    print "assert: ", $c , "zero groups found \n";
}

HERE



```

# task check
```
regexp: State\s+:\s+\S+
```

# task check
```
between: {'===>'} {'<==='}

  regexp: (\S+)

end:

generator: <<CODE
!perl6

  my @skip-list;
  
  if config()<skip> {
    @skip-list = config()<skip><>;
  }
  
  my @list = get_state()<packages><> || [];
   
  for captures()<> -> $c {
    #say  "note: push {$c[0]} ...";
    if @skip-list.Set{$c[0]} {
      say  "note: skip {$c[0]} ...";
    } else {
      push @list, %( package => "{$c[0]}" );
    }
  }
  
  update_state(%( packages => @list ));

CODE
```

# task check
```
#a-sort1:[5 6 7 11 12 13]
#a-sort2:[1 2 5 6 7 7 56]
a-sort3:(6 [1 2 4 8])
a-sort4:(2 [1 2 3])
a-sort5:(0 [1 2 3 4 5 6])
a-sort6:(6 [1 2 3 4 5])
a-sort7:(4 [1 1 2 2 3])
a-sort8:(4 [1 2 5 6])
a-sort9:(9 [1 2 2 5 8 34 34 56 73])
a-sort11:(494 [1 36 39 105 146 154 168 170 204 206 217 219 225 227 272 282 293 300 312 323 328 328 335 359 370 383 392 395 396 403 413 422 437 443 448 462 463 465 468 479 492 496])
```

# task check
```
regexp: "deleted ok" | "Function not found"
```

# task check
```
[5, 6, 7, 11, 12, 13]
```

# task check
```
a-sort1:[5 6 7 11 12 13]
a-sort2:[1 2 5 6 7 7 56]
```

# task check
```
```

# task check
```
begin:
in order1
pick G
pick D
pick B
pick E
pick A
pick F
pick C
===
end:


begin:
pre order1
pick A
pick B
pick D
pick G
pick E
pick C
pick F
===
end:

begin:
pre order2
pick A
pick B
pick D
pick E
pick C
pick F
===
end:


begin:
in order2
D
B
E
A
F
C
===
end:

begin:
post order1
D
E
B
F
C
A
===
end:```

# task check
```
begin:
  regexp: ^^ '=== InOrder' $$
  4
  2
  5
  1
  3
  regexp: ^^ '===' $$
end:

begin:
  regexp: ^^ '=== InOrder2' $$
  1
  2
  3
  4
  5
  6
  7
  regexp: ^^ '===' $$
end:

begin:
  regexp: ^^ '=== PostOrder' $$
  4
  5
  2
  3
  1
  regexp: ^^ '===' $$
end:

begin:
  regexp: ^^ '=== PreOrder' $$
  1
  2
  4
  5
  3
  regexp: ^^ '===' $$
end:

begin:
  regexp: ^^ '=== InOrder3' $$
  a
  b
  c
  d
  e
  f
  g
  h
  i
  j
  regexp: ^^ '===' $$
end:
```

# task check
```
```

# task check
```
removed
```

# task check
```
created
```

# task check
```
generator: <<CODE
my $host = config()->{host};
[ "<$host> is alive" ]
CODE
```

# task check
```
directory-delete-ok

```

# task check
```
generator: <<CODE

!bash

owner=$(config owner)
group=$(config group)

if ! test $os = "minoca" && ! test $os = "darwin"; then

  if test "${owner}"; then
    echo 'owner: <'$(config owner)'>' 
  fi
  
  if test "${group}"; then
    echo 'group: <'$(config group)'>' 
  fi
  
fi

CODE

```

# task check
```
git-async-push-done
```

# task check
```
generator:<<CODE
  my $context = config()->{context};  
  [ 
    "regexp: Name\\s+:\\s+$context"
  ]
CODE
```

# task check
```
begin:
len=0 cap=0 []
len=1 cap=1 [0]
len=2 cap=2 [0 1]
len=5 cap=6 [0 1 2 3 4]
end:
```

# task check
```
regexp: "postgres:" \s+ "writer" \s+ "process"
```

# task check
```
```

# task check
```
generator: <<CODE
!raku
if config()<expect_stdout> {
  say "regexp: ", config()<expect_stdout>
}
CODE
```

# task check
```
begin:
>>>
a len=5 cap=5 [0 0 0 0 0]
b len=0 cap=5 []
c len=2 cap=5 [0 0]
d len=3 cap=3 [0 0 0]
<<<
end:
```

# task check
```
begin:
{"dir_to_dump":"/tmp/foo/","stream_type":"Directory Dump","type":"header"}
--/f
{"depth":0,"type":"dir"}
--/f
generator: <<CC 
!bash
echo  'regexp: {"depth":1,"filename":"bar","group":"'$USER'","mtime":"\S+","perms":"0755","type":"dir","user":"'$USER'"}'
CC

--/f
{"depth":1,"type":"updir"}
--/f
{"depth":0,"type":"updir"}
--/f
"type":"footer"
--/f
end:

```

# task check
```
begin:
A : blAck
B : Blue
end:
```

# task check
```
p is nil!

```

# task check
```
Complete! Modules were installed into
Starting perl-app... started
install-ok
```

# task check
```
regexp: ^^ \s* \S+ \s+  Ready \s+  master \s+  \S+   \s+ \S+ \s* $$
```

# task check
```
regexp: \/sshd\s+-D\s+
```

# task check
```
{40.68433 -74.39967}
```

# task check
```
OK

```

# task check
```
begin:
/usr/sbin/gpm
64593
03:0c
0
end:

```

# task check
```
regexp: 8048000-8056000\s+r-xp\s+00000000\s+03:0c\s+64593\s+\/usr\/sbin\/gpm
```

# task check
```
/bin/sleep
```

# task check
```
begin:
fib, i=1, a=0, b=1, c=1
fib, i=2, a=1, b=1, c=1
fib, i=3, a=1, b=2, c=2
fib, i=4, a=2, b=3, c=3
fib, i=5, a=3, b=5, c=5
fib, i=6, a=5, b=8, c=8
fib, i=7, a=8, b=13, c=13
fib, i=8, a=13, b=21, c=21
fib, i=9, a=21, b=34, c=34
end:
```

# task check
```
regexp: ProvisioningState\s+:\s+Succeeded
```

# task check
```
begin:
1
10
10
2
4
4
end:
```

# task check
```
begin:
@ dist.ini:1 @
regexp: csvgrep\x1b\[7m\x1b\[27m
regexp: csvgrep\x1b\[7mper\x1b\[27m
author  = Neil Bowers <neilb@cpan.org>
end:

```

# task check
```
generator: <<RAKU
!raku

use Parser;
say "note: lookup {config()<type>} ...";
parse-message(config()<type>);
RAKU


```

# task check
```
regexp:  ([ "message" || "enum" ]) \s+  (\S+)  \s+ \{

#note: "types list"
#note: ============

code: <<RAKU
!raku

my @list;

for captures().flat -> $i {
  #say $i[0], " ", $i[1];
  @list.push: %( name => $i[1], type => $i[0] );
}

update_state(%( list => @list ));

RAKU
```

# task check
```
regexp: 200 \s* $$
```

# task check
```
branch found

```

# task check
```
regexp: "HTTP/" \d "." \d \s+ "200 OK" \s* $$
```

# task check
```
begin:
{10 10}
{10 10}
{5 5}
{3 3}
{3 3}
end:
```

# task check
```
install-ok
```

# task check
```
generator: <<CODE
!bash
echo git user.email $(config email)
echo git user.name $(config name)
CODE


generator: <<CODE
!bash
set_credential_cache=$(config set_credential_cache)
if test "${set_credential_cache}" = "on"; then
  echo git credential.helper cache --timeout=3000000
fi



```

# task check
```
install-ok
```

# task check
```
output: [1 2 1 3 0 2 1] cnt=3
output: [2 0 2] cnt=2
output: [3 0 2 0 4] cnt=7
output: [7 4 0 9] cnt=10
output: [6 9 9] cnt=0
```

# task check
```
|[4, 1, 2, 1] max=4|
|[4, 3, 5, 1, 2] max=3|
|[2, 4, 2, 2, 3] max=4|
```

# task check
```
generator: <<CODE
!perl6
say "regexp: ^^ '{config()<name>}' \\S+ \\s+ POD_OK \$\$";
CODE


generator: <<CODE
!perl6

if captures() {
  say "assert: ", captures()<>.elems == config()<num> ?? "1" !! "0", " {config()<num>} pods are running";
}

CODE
```

# task check
```
regexp: '"LastUpdateStatus":' \s+ '"Successful"'
```

# task check
```
generator: <<RAKU
!raku

my $parent = config()<parent>;
my $id = config()<id>;

my $tabs = 0;

if ".lc4/{$parent}.tabs".IO ~~ :e {
  $tabs = ".lc4/{$parent}.tabs".IO.slurp.chomp;
}

my $tabs-s = " " x $tabs;
 
#say "note: insert $id {config()<type>} into {$parent} tabs=$tabs";

mkdir ".lc4";

".lc4/{$id}.tabs".IO.spurt($tabs+2);

if $parent eq "model" or $parent eq "views" or $parent eq "deployment" {
  my $ex = q|between: { "%p%" \s+ \{  } {  ^^ "%t%" \} $$ }|.subst(
    "%p%",config()<parent>,
  ).subst(
    "%t%",
    $tabs-s,
  );
  say "note: $ex";
  say $ex;
} elsif config()<type> eq "include"  or config()<type> eq "group" {
  my $ex  = q/between: {/;
  $ex     ~= q/[ view \s+ "%p%" \s+ of \s+ \S+/; # model view - view foo of bar
  $ex     ~= q/ || view \s+ "%p%" /; # deployment view 
  $ex     ~= q/ || \""%p%"\" /; # other cases, for example group
  $ex     ~= q/] \s+ \{ \s* $$ }/; # end of alternations, closing first between block
  $ex     ~= q/ {  ^^ "%t%" \} $$ }/;
  $ex.=subst(
    "%p%",
    config()<parent>,
    :g,
  );
  $ex.=subst(
    "%t%",
    $tabs-s,
    :g,
  );
  say "note: $ex";
  say $ex;
} else {
  my $ex = q/between: { "%p%" \s+  "=" \s+ \S+ \s+ \" .* \" \s+ /;
  $ex ~= q/\{ \s* $$ } {  ^^ "%t%" \} $$ }/;
  $ex.=subst(
    "%p%",
    config()<parent>,
    :g,
  );
  $ex.=subst(
    "%t%",
    $tabs-s,
    :g,
  );
  say "note: $ex";
  say $ex;
}
say ":any:";
say "end:";
RAKU


generator: <<RAKU
!raku
my $id = config()<id>;
my $last-line = matched()<>.tail;
my $type = config()<type>;
my $ln = captures-full().tail.<index>;
my $tabs = ".lc4/{$id}.tabs".IO.slurp.chomp;
say "note: // insert {config()<type>} {$id} tabs=$tabs line=$ln";
my $tabs-s = " " x $tabs;

my $element;
if $type eq "view" {
  if config()<deployment> {
    $element = "{$tabs-s}deployment view {$id} \{\n";
  } else {
    $element = "{$tabs-s}view {$id} of {config()<system>} \{\n";
  }
  $element ~= "{$tabs-s}  title \"{config<desc>}\"\n{$tabs-s}\}";
} elsif $type eq "include" {
  $element = "{$tabs-s}include {$id}";
} elsif $type eq "link" {
  my ($a, $b) =  config()<id>.split(":");
  my $proto = config()<proto> ?? ".{config()<proto>}" !! "->";
  $element = "{$tabs-s}{$a} $proto {$b} \"{config()<desc>}\"";
} elsif $type eq "instance_of" {
  my ($a, $b) =  config()<id>.split(":");
  $element = "{$tabs-s}{$a} = instanceOf {$b}";
} elsif $type eq "group" {
  $element = "{$tabs-s}group \"{$id}\" \{";
  $element ~= "\n{$tabs-s}  title \"{config()<desc>}\"";
  $element ~= "\n{$tabs-s}\}";
}  else {
  $element = "{$tabs-s}{$id} = {$type} \"{config()<desc>}\" \{";
  if config()<long_desc> {
    $element ~= "\n{$tabs-s}  description \"{config()<long_desc>}\""
  }
  if config()<multiple> {
    $element ~= "\n{$tabs-s}  style \{";
    $element ~= "\n{$tabs-s}    multiple true";
    $element ~= "\n{$tabs-s}  \}";
  }
  $element ~= "\n{$tabs-s}\}";
}
my $file = config()<deployment> ?? "deployment.c4" !! "model.c4";

replace(
  $file,
  $ln,
  "$element\n$last-line"
);
RAKU

code: <<BASH
!bash
if test $(config deployment) = "True"; then
  cat deployment.c4
else
  cat model.c4
fi
BASH
```

# task check
```
regexp: access time\s+before\s+(\d+)
code: our $at = capture()->[0]

regexp: access time\s+after\s+(\d+)
code: our $bt = capture()->[0]


generator: <<P
  our $at; our $bt;
  my $st = (($bt - $at) == 30);
 [ "assert: $st access time changed +30 seconds"]

P


regexp: modification time\s+before\s+(\d+)
code: our $at1 = capture()->[0]

regexp: modification time\s+after\s+(\d+)
code: our $bt1 = capture()->[0]


generator: <<P
  our $at1; our $bt1;
  my $st = (($bt1 - $at1) == 0);
 [ "assert: $st modification time changed 0 seconds"]

P

```

# task check
```
```

# task check
```
content generated
```

# task check
```
regexp: target \s+ \S+ \s+ updated

```

# task check
```
[3, 4, 5, 20, 30]```

# task check
```
sorted1: 3 4 5 20 30
```

# task check
```
#2018-10-23 03:00:00.099897  schedule

generator: <<CODE
!bash

  date=$(config date)
  scheduled_only=$(config scheduled_only)

  if ! test "${date}"; then
    date=$(date +%Y-%m-%d)
  elif test "${date}" = "any"; then
    date='\d\d\d\d-\d\d-\d\d'
  fi

  if test "${scheduled_only}" = "on"; then
    echo 'regexp: completed\s+(succeeded|\S).*\s+'$date\\s+\\S+\\s+schedule
  else
    echo 'regexp: completed\s+(succeeded|\S).*\s+'$date\\s+\\S+\\s+[^schedule]
  fi
  
CODE

generator: <<CODE
  my @out;
    if (capture()->[0] ne 'succeeded'){
      push @out, "assert: 0 last build succeeded"
    } else {
      push @out, "assert: 1 last build succeeded"
    }
  [@out]
CODE
```

# task check
```
```

# task check
```
case1: 2 0 3 1
case2: 0 1 3 2 4 5

```

# task check
```
case1: [2 0 3 1]
case2: [0 1 3 2 4 5]

```

# task check
```
[5, 6, 7, 11, 12, 13]```

# task check
```
a-sort1:[5 6 7 11 12 13]
a-sort2:[1 2 5 6 7 7 56]
```

# task check
```
regexp: :i 'login successful'
```

# task check
```
generator: <<CODE
!perl6
  say "note: ", "verify host [{task_var('host')}] start";
  say config()<state>.IO.slurp;
  say "note: ", "verify host [{task_var('host')}] end";
CODE
```

# task check
```
regexp: :i 'meta info has been updated'
```

# task check
```
leftsubtreeFIFO: [1, 2, 4]
```

# task check
```
regexp: 'directory:' \s+ (\S+) \s* $$

code: <<CODE
!perl6

if capture().elems {
  update_state(%( directory => capture()[0] ))
}  

CODE
```

# task check
```
regexp: "count:" \s+ (\d+)

generator: <<code
!perl6
  my $cnt = capture()[0];
  say "assert: ", ($cnt == 0 ?? 1 !! 0), " zero stale process found";
code


```

# task check
```
Hello from Docker!
```

# task check
```
generator: <<CODE
for my $r (@{task_var("check")}){
  print 'regexp: ^^ "', $r, '" $$', "\n";
}
CODE
```

# task check
```
begin:
create database foo
Affected row: 1
end:

begin:
create table foo.bar (name text)
Affected row: 0
end:

begin:
insert into foo.bar (name) values ('alexey')
Affected row: 1
end:


begin:
SELECT name from foo.bar
Name : alexey
end:

```

# task check
```
begin:
SELECT Host,User FROM user WHERE User='root' AND Host='127.0.0.1'
Host : 127.0.0.1 User: root
end:

begin:
SELECT Host,User FROM user WHERE User='root' AND Host='localhost'
Host : localhost User: root
end:



```

# task check
```
regexp: "HTTP/" \d "." \d \s+ ( "201 Created" || "409 Conflict" ) \s* $$
```

# task check
```
case1 path: (0 3 4 5)
case2 path: (0 3 7)
case3 path: (2 1 0 3 4 6)
```

# task check
```
regexp: \s+ 201 \s* $$ || \s+ 409 \s* $$
```

# task check
```
regexp: \s+ 200 \s* $$
```

# task check
```
project found
```

# task check
```
ok
```

# task check
```
```

# task check
```
```

# task check
```
```

# task check
```
regexp: (\S+) \s+ '=' \s+ (\S+)

generator: <<CODE
!perl6

my $dummy-value = config()<dummy_value>;

say "note: dummy value: {$dummy-value}";

for captures()<> -> $i {
	
	if $i[1] ~~ /$dummy-value/ {
		say "assert: 0 {$i[0]} - no dummy values found"
	}
}

CODE
```

# task check
```
note: <<<
note: check if required fields are set
note: >>>

note:
note: maintainer
note: ==========
note: Should be a well-formatted, 
note: example is: maintainer="John Snow <john_snow@thewall.net>"

within: ^^ "maintainer=" (.*) $$
regexp: ^^ \" (.*) \" $$

generator: <<RAKU
!raku
  if matched() {
    say "note: maintainer line found: ", capture()[0] 
  } else {
    say "assert: 0 maintainer line found";
  }
RAKU

note: check maintainer identity

regexp: (<[ \w \s ] >+?) "<" (<[ \w \. ] > + \@ <[ \w \. ] > + ) ">" \s* $$ 

end:

generator: <<RAKU
!raku
  if matched() {
    say "note: Name: ", capture()[0]; 
    say "note: Email: ", capture()[1];
    if capture()[0] ~~ /\S/ {
      say "assert: 1 maintainer line is not broken";
    } else {
      say "note: empty Name";
      say "assert: 0 maintainer line is not broken";
    }
  } else {
    say "assert: 0 maintainer line is not broken";
  }
RAKU

regexp: ^^ "pkgname=" (\S+)

generator: <<RAKU
!raku
if matched() {
  my $pkgname = capture()<>.head;
  say "note: run apk info $pkgname command and save output to file (/tmp/pkg.info)";
  say q:to /BASH/.subst("%name%",$pkgname);
    code: <<CMD
    !bash
    apk info -d %name% > /tmp/pkg.info
    CMD 
  BASH
}
RAKU

note: get pkgrel from file

regexp: ^^ \s* "pkgrel=" (\d+) \s* $$

generator: <<RAKU
!raku
  if matched() {
    my $pkgrel = capture()[0];
    say "note: pkgrel found: ", $pkgrel;
    update_state(%( :$pkgrel ));	
  } else {
    say "assert: 0 pkgrel found";
  }
RAKU

source: /tmp/pkg.info

note: get pkgrel from apk info command output

regexp: .*  "-" r(\S+) \s+ "description:" $$

generator: <<RAKU
!raku
  if matched() {
    my $pkgrel = capture()[0];
    say "note: pkgrel found: ", $pkgrel;
    my $apk-pkgrel = get_state()<pkgrel> || "NA";
    if $apk-pkgrel eq "NA" {
       say "note: could not find pkgrel in apk info command output, first time package released?";
    } else {
       say "assert: ", $apk-pkgrel ne $pkgrel, " pkgrel from file differs from pkgrel from apk info command output";
    }
  } else {
    say "assert: 0 pkgrel found";
  }
RAKU
```

# task check
```
begin:
value: 3.141592653589793 type: main.myFloat
3.141592653589793
value: &{Hello} type: *main.TT
Hello
end:
```

# task check
```
# the script should print "hello"
hello
```

# task check
```
result: [5, 6, 7, 11, 12, 13]```

# task check
```
a-sort1:[5 6 7 11 12 13]
a-sort2:[1 2 5 6 7 7 56]
```

# task check
```
begin:
1
2
4
8
16
32
64
128
256
512
end:
```

# task check
```
code: our $NEXT = undef;

regexp: continue: (true|false)

generator: <<CODE
our $cnt = capture()->[0];
if ($cnt eq 'true') {
  [
   'regexp: next: (\S+)',
   'code: our $NEXT = capture()->[0]'
  ]
}

CODE

regexp: repo: (\S+)

code: <<CODE
  our @REPOS;
  push @REPOS, map {$_->[0]} @{captures()}; 
CODE

```

# task check
```
```

# task check
```
map[Bell Labs:{40.68433 -74.39967} Google:{37.42202 -122.08408}]
```

# task check
```
note: postgresql should be seen in a repo index
begin:
regexp: [Available || Installed] \s+ Packages
postgresql-server.
end:  

note: database should be initialized 
regexp: ["Initialized, logs are in /var/lib/pgsql/initdb_postgresql.log" || "ERROR: Data directory /var/lib/pgsql/data is not empty!"]

note: postgresql server should be started
Started PostgreSQL database server
```

# task check
```
within: ^^ \s* "HOOKS=(" .* ")" \s* $$
  note: should have base  udev filesystems in HOOKS
  regexp: <?wb> base <?wb> 
  regexp: <?wb> udev <?wb>
  regexp: <?wb> filesystems <?wb>
  note: should not have keyboard
  !regexp: <?wb> keyboard <?wb>
end:
```

# task check
```
Hello
```

# task check
```
merge_sort1: [5, 6, 7, 11, 12, 13]
merge_sort2: [1, 2, 5, 6, 7, 7, 56]
```

# task check
```
a-sort1:[5 6 7 11 12 13]
a-sort2:[1 2 5 6 7 7 56]
```

# task check
```
done
```

# task check
```
done
```

# task check
```
generator: print '{'.(config()->{service})."} running\n"
```

# task check
```
generator: print  '{'.(config()->{service})."} stopped\n"
```

# task check
```
install ok
```

# task check
```
regexp: ^^ \s* 'Fetch URL:' \s* (\S+)

generator: <<RAKU
!perl6
my $url = capture()[0];
say "note: url found: [{$url}]";
if $url ~~ / ^^ https? ':' '//' (\S+) '/' (\S+) '/' (\S+) '.git' $$/ {
  my $host = $0;  
  my $user = $1;  
  my $project = $2;  
  say "note: host found: [$host]";
  say "note: project found: [$project]";
  say "note: user found: [$user]";

  if $host eq 'github.com' {
    update_state %( change => True, from => $url, to => "git\@github.com:$user/$project.git" );
    say "note: change to from [$url] to [git\@github.com:$user/$project.git]";
    say qq:to/HERE/;
    code: <<BASH
    !bash
    set -x
    set -e
    git remote remove origin
    git remote add origin git\@github.com:$user/$project.git
    BASH
    HERE
  } else {
    say "note: host is not guthub, exit"
  }
} else {
    say "note: host is not appeared as https host, nothing to fix here"
}
RAKU

```

# task check
```
geeksforgeeks is not a palindrome
geeksogeeks is a palindrome
```

# task check
```
begin:
false
true
Apple
false
end:
```

# task check
```
regexp: ansible\s+\S
```

# task check
```
regexp: (bar|rab)
```

# task check
```
```

# task check
```
begin:
regexp: "Implementing the Raku"  .* "Programming Language" \s+ \S+
regexp: "Built on" \s+ \S+ \s+ "version" \s+ \S+
end:
```

# task check
```
LOOK MA', NO WRAP!

```

# task check
```
1
ciao sparrow


```

# task check
```
regexp: Binary files.*differ
```

# task check
```
Hello World

```

# task check
```
regexp: PASS
!regexp: FAIL
```

# task check
```
OK

generator: <<CODE
!ruby
  foo
CODE


generator: <<CODE
!ruby

  puts config['foo']['bar']['baz']

CODE

```

# task check
```

generator: <<CODE
!bash
version=$(config tomcat-version)
war=$(config war)

for p in $(perl -e "print join ' ', (split ',', qq{$war})")
do

  echo -n between: Deploying\\sweb\\sapplication\\sarchive\\s\\S+/$p
  echo -n ' '
  echo Deployment\\sof\\sweb\\sapplication\\sarchive\\s\\S+\/$p\\shas\\sfinished
  echo regexp: '.*'

  echo "code: note qq{$p}";

  echo -ne 'generator: note @{stream()->[-1]}[-1]; ' 
  echo -ne 'my $s = join " ", @{stream()->[-1]}; [ "assert: ". (! ($s=~/SEVERE: Context/)). '
  echo "qq{ $p deployed OK } ]"
      
done


CODE


```

# task check
```
begin:
0
1
1
2
3
5
8
13
21
34
55
end:
```

# task check
```
|dinners: [2, 6], gap(K)=1, cnt: 3|
|dinners: [6, 11, 14], gap(K)=2, cnt: 1|
```

# task check
```
81  5  13
```

# task check
```
{10000 0}
```

# task check
```
begin:
rc file generated from template
rc file updated
end:


```

# task check
```
```

# task check
```
[a=[1 5 7 -1] sum=6 cnt=2]
[a=[1 5 7 -1 5] sum=6 cnt=3]
[a=[1 1 1 1] sum=2 cnt=6]
[a=[10 12 10 15 -1 7 6 5 4 2 1 1 1] sum=11 cnt=9]
[a=[1 2 3 4 5 6 7] sum=8 cnt=3]
[a=[1 2 3 4 5 6 7] sum=98 cnt=0]
```

# task check
```
[Mr%20John%20Smith]
```

# task check
```
Jenkins
```

# task check
```
begin:
State
---
    generator: <<CODE
    !perl6
    say config()<state>
    CODE
end:```

# task check
```
note: check header
regexp: ^^ "name=" \S+ $$

generator: <<RAKU
!perl6

if config()<annotations> {

  say "note: >>> check annotations";
  say 'between: {"[annotations_start]"} {"[annotations_end]"}';

  if config<annotations>.isa(Array) {
    for config<annotations><> -> $i {
      say "regexp: ^^ '[' '$i' '=' .* ']' \$\$"
    }
  } else {
    my %h = config<annotations>;
    for %h -> $i {
      say "[{$i.key}={$i.value}]"
    }
  }

  say "end:";
}

if config()<labels> {

  say "note: >>> check labels";
  say 'between: {"[labels_start]"} {"[labels_end]"}';

  if config<labels>.isa(Array) {
    for config<labels><> -> $i {
      say "regexp: ^^ '[' '$i' '=' .* ']' \$\$"
    }
  } else {
    my %h = config<labels>;
    for %h -> $i {
      say "[{$i.key}={$i.value}]"
    }
  }

  say "end:";
}


RAKU

```

# task check
```
[ 1 2 3 4 5 6 7 ]
```

# task check
```
[1 2 3 4 5 6 7]
```

# task check
```
[1 2 3 4 5 6 7]
```

# task check
```
regexp: (\d+) \s+ '-' \s+ for \s+ (\w+)

code: <<CODE

use Data::Dumper; 

print Dumper(captures());

CODE

generator: <<CODE

print "assert: ", captures()->[0]->[0] == 1 ? 1 : 0, " captures0,0 == 1\n";
print "assert: ", captures()->[0]->[1] eq 'one' ? 1 : 0, " captures0,1 == one\n";

print "assert: ", captures()->[1]->[0] == 2 ? 1 : 0, " captures1,0 == 2\n";
print "assert: ", captures()->[1]->[1] eq 'two' ? 1 : 0, " captures1,1 == two\n";

print "assert: ", captures()->[2]->[0] == 3 ? 1 : 0, " captures2,0 == 3\n";
print "assert: ", captures()->[2]->[1] eq 'three' ? 1 : 0, " captures2,1 == three\n";

print "assert: ", capture()->[0] == 1 ? 1 : 0, " capture0 == 1\n";
print "assert: ", capture()->[1] eq 'one' ? 1 : 0, " capture1 == one\n";


CODE
```

# task check
```
OK
inline: a=100
a=100
```

# task check
```
generator: <<GENE
!python
print("assert: 1 this is ever true!!!")
GENE


generator: <<GENE
!python
def foo():
  print("assert: 1 this is also ever true!!!")

foo()
GENE
```

# task check
```
Hello
code: print "hi there!\n";
Hello
```

# task check
```
regexp: \d\d\d\d '-' \d\d '-' \d\d # date in format of YYYY-MM-DD
regexp: 'Name:' \s+ \w+ # name
regexp: 'App Version Number:' \s+ \d+ \. \d+ \. \d+ # version number

```

# task check
```
note: between: {'{'} {'}'}
between: {'{'} {'}'}
  note: regexp: (\S+)
  regexp: (\S+)
code: <<CODE
!ruby
  require 'pp'
  PP.pp(streams_array());
CODE

generator: <<CODE
!ruby
 check = [[["{"], ["A"], ["B"], ["C"], ["}"]], [["{"], ["a"], ["b"], ["c"], ["}"]], [["{"], ["aa"], ["bb"], ["cc"], ["}"]]] 
 if streams_array().eql? check
 then
  puts "assert: 1 results correct"
 else
  puts "assert: 0 results correct"
 end
CODE
```

# task check
```
item1=[1]
item2=[2]
item3=[3]
item4=[4]
```

# task check
```
note: between: {'{'} {'}'}
between: {'{'} {'}'}
  note: regexp: (\S+)
  regexp: (\S+)
end:

code: <<RAKU
!raku
use Data::Dump;
say Dump(streams_array());
#dump_streams();
RAKU

generator: <<CODE
!raku
  say "note: streams_array()[0][0][0] = ", streams_array()[0][0][0];
  say "assert: ", streams_array()[0][0][0] eq '{' ?? 1 !! 0,  " streams_array()[0][0][0] == \{";

  say "note: streams_array()[0][1][0] = ", streams_array()[0][1][0];
  say "assert: ", streams_array()[0][1][0] eq '1' ?? 1 !! 0,  " streams_array()[0][1][0] == 1";

  say "note: streams_array()[0][2][0] = ", streams_array()[0][2][0];
  say "assert: ", streams_array()[0][2][0] eq '2' ?? 1 !! 0,  " streams_array()[0][2][0] == 2";

  say "note: streams_array()[0][3][0] = ", streams_array()[0][3][0];
  say "assert: ", streams_array()[0][3][0] eq '3' ?? 1 !! 0,  " streams_array()[0][2][0] == 3";

CODE


generator: <<CODE
!raku
  say "note: streams_array()[1][0][0] = ", streams_array()[1][0][0];
  say "assert: ", streams_array()[1][0][0] eq '{' ?? 1 !! 0,  " streams_array()[1][0][0] == \{";

  say "note: streams_array()[1][1][0] = ", streams_array()[1][1][0];
  say "assert: ", streams_array()[1][1][0] eq 'a' ?? 1 !! 0,  " streams_array()[1][1][0] == a";

  say "note: streams_array()[1][2][0] = ", streams_array()[1][2][0];
  say "assert: ", streams_array()[1][2][0] eq 'b' ?? 1 !! 0,  " streams_array()[0][2][0] == b";

  say "note: streams_array()[1][3][0] = ", streams_array()[1][3][0];
  say "assert: ", streams_array()[1][3][0] eq 'c' ?? 1 !! 0,  " streams_array()[0][2][0] == c";

CODE

end:
```

# task check
```
generator: <<CODE

  my %d = ( 'foo' => 'foo value', 'bar' => 'bar value' );

  print join "\n", map { ( "# $_ ", $d{$_} ) } keys %d;
  
CODE

```

# task check
```
hello world, var1: php
```

# task check
```
WHITE RABBIT
```

# task check
```
regexp: hello # this is the comment
hello # this is the comment 
# this is the comment
 h #
regexp: '/hello/'
```

# task check
```
hello 
```

# task check
```
check_mode_soft:

between: {OK} {DONE}
    regexp: HOWAREYOU \s+ (\d+)
end:

code: <<RAKU
!raku
if matched().elems {
    my $ln = captures-full()[0]<index>;
    my $num = capture()[0].Int;
    $num++;
    replace("{cache_root_dir()}/file.txt",$ln,"BYE $num");
}
RAKU

code: <<BASH
!bash
cat $cache_root_dir/file.txt
BASH

check_mode_hard:

between: {OK} {DONE}
    regexp: HELLO \s+ (\d+)
end:
```

# task check
```
ruby rocks!
```

# task check
```
regexp: ('I am OK' || 'I am ok')
```

# task check
```
generator: <<CODE
!bash
if test -z "$FOO_THING"; then
  echo assert: 0 FOO_THING variable is defined
else
  echo assert: 1 FOO_THING variable is defined
fi
echo FOO: $FOO_THING
CODE
```

# task check
```
generator: <<CODE
!perl6
  say "assert: ", config<main><foo>.defined, ' config<main><foo>.defined';
  say "[{config<main><foo>}]";
CODE

generator: <<CODE
!perl6
  say "assert: ", config<language>.defined, ' config<language>.defined';
  say "hello world from [{config<language>}]";
CODE


generator: <<CODE
!perl6
  say "assert: ", task_var('amount').defined, ' task_var("amount").defined';
  say "you passed me [{task_var('amount')}] USD";
CODE

```

# task check
```
generator: <<CODE
!bash
name=$(task_var name)
echo hello: $name 
echo
bash_generator $name
CODE

```

# task check
```
downstream OK

```

# task check
```
generator:<<CODE
!perl6
  say "assert: ", defined(task_var("name")) ?? 1 !! 0, " variable name is defined";
  say "assert: ", defined(task_var("message")) ?? 1 !! 0, " variable message is defined";
  say task_var("name"), " say ", task_var("message");
CODE
```

# task check
```
generator: [ "foo: ".().task_var('foo') ] 

generator: <<CODE
[ 
  "foo: ".().task_var('foo') 
] 
CODE

generator: <<CODE
!ruby
  puts "foo: #{task_var('foo')}" 
CODE

generator: [ "bar: ".().task_var('bar') ] 

generator: <<CODE
[ 
  "bar: ".().task_var('bar') 
] 
CODE

generator: <<CODE
!ruby
  puts "bar: #{task_var('bar')}" 
CODE

foo:
bar:

```

# task check
```

generator: <<CODE
!perl6
    my $foo = task_var('foo');
    say "assert: ", defined($foo), " foo variable is defined"; 
    say "foo: ",task_var("foo");
CODE
```

# task check
```
foo done

```

# task check
```
bar done
hello bar!

code: <<CODE
our @foo;
$foo[2]="bar was here";
CODE
```

# task check
```
generator: <<CODE
!python
from sparrow6lib import *
print("foo: " + task_var('foo'))
print("bar: " + task_var('bar'))
CODE


```

# task check
```
bad end
```

# task check
```
generator: <<CODE
!bash
echo $(config 'main.foo')
CODE


```

# task check
```
generator: <<CODE
!perl6
1
say "OK";
CODE
```

# task check
```
# between expression:
between: { '<table' .* '>' } { '</table>' }
regexp: '<td>' (\S+) '</td>'
end:

# or even so
between: { '<tr' .* '>' } { '</tr>' }
regexp: '<td>' (\S+) '</td>'
end:
```

# task check
```
begin:

  hello
  regexp: .*orld
  jan

  code: dump_streams();

end:
```

# task check
```
generator: print 'A'x99
```

# task check
```
item1 = 1
item2 = 2
item3 = 3
item4 = 4
```

# task check
```
PYTHON SIMPLE STORY
```

# task check
```
generator: <<CODE
!perl6
  say "assert: ", config<main><foo>.defined, ' config<main><foo>.defined';
  say "[{config<main><foo>}]";
CODE

```

# task check
```
ruby rocks!
generator: <<CODE
!ruby
puts ruby_rocks()
CODE
```

# task check
```
main.foo: 1

generator: <<CODE
!python
from sparrow6lib import *
print('main.foo: ' + config()['main']['foo'])
CODE
```

# task check
```
I am ok, really
HELLO Sparrow6
```

# task check
```
between: {foo} {bar}
    regexp: (1)
    code: print capture()->[0], "\n"
    regexp: (2)
    code: print capture()->[0], "\n"
    regexp: (3)
    code: print capture()->[0], "\n"
end:
```

# task check
```
begin:
  aaa
  bbb
  regexp: ^^  $$
  ccc
end:

```

# task check
```
begin:
    # plain strings
    this string followed by
    that string followed by
    another one
    # regexp patterns:
    regexp: with \s+  ( this || that )
    # and the last one in a block
    at the very end
end:

```

# task check
```
regexp: (\S+)

generator: <<RAKU
!perl6
my $word = capture()[0];
say "note: new word found"
RAKU

code: <<CODE
!bash
echo OK
CODE
```

# task check
```
note: Harden sysctl.conf
note: Rules taken from https://www.cyberciti.biz/faq/linux-kernel-etcsysctl-conf-security-hardening/

note:
note: Disable IP packet forwarding
note:

regexp: ^^ "net.ipv4.ip_forward" \s* "=" \s* 0 \s* $$
!regexp: ^^ "net.ipv4.ip_forward" \s* "=" \s* 1 \s* $$


note:
note: Do not accept source routing
note:

regexp: ^^ "net.ipv4.conf.default.accept_source_route" \s* "=" \s* 0 \s* $$
!regexp: ^^ "net.ipv4.conf.default.accept_source_route" \s* "=" \s* 1 \s* $$

note:
note: Controls the System Request debugging functionality of the kernel
note:

regexp: ^^ "kernel.sysrq" \s* "=" \s* 0 \s* $$
 
note:
note: Controls whether core dumps will append the PID to the core filename
note: Useful for debugging multi-threaded applications
note:


regexp: ^^ "kernel.core_uses_pid" \s* "=" \s* 1 \s* $$
 
note:
note: Controls the use of TCP syncookies
note: Turn on SYN-flood protections
note:

regexp: ^^ "net.ipv4.tcp_syncookies" \s* "=" \s* 1 \s* $$
regexp: ^^ "net.ipv4.tcp_synack_retries" \s* "=" \s* (\d+) \s* $$
generator: <<RAKU
!raku
if matched().elems {
  my $v = capture()[];
  say "note: net.ipv4.tcp_synack_retries={$v}";
  if $v >= 3 && $v <= 5 {
     say "assert: 1 net.ipv4.tcp_synack_retries in [3..5] range"
  } else {
     say "assert: 0 net.ipv4.tcp_synack_retries in [3..5] range"
  }
} else {
  say "note: net.ipv4.tcp_synack_retries setting not found"
}
RAKU

note:
note: IPv4 networking start
note:

note: Send redirects, if router, but this is just server
note: So no routing allowed 
note:

regexp: ^^ "net.ipv4.conf.all.send_redirects" \s* "=" \s* 0 \s* $$
regexp: ^^ "net.ipv4.conf.default.send_redirects" \s* "=" \s* 0 \s* $$
 
note:
note: Accept packets with SRR option? No
note:

regexp: ^^ "net.ipv4.conf.all.accept_source_route" \s* "=" \s* 0 \s* $$
 
note:
note: Accept Redirects? No, this is not router
note:

regexp: ^^ "net.ipv4.conf.all.accept_redirects" \s* "=" \s* 0 \s* $$
regexp: ^^ "net.ipv4.conf.all.secure_redirects" \s* "=" \s* 0 \s* $$
 
note:
note: Log packets with impossible addresses to kernel log? yes
note:

regexp: ^^ "net.ipv4.conf.all.log_martians" \s* "=" \s* 1 \s* $$
regexp: ^^ "net.ipv4.conf.default.accept_source_route" \s* "=" \s* 0 \s* $$
regexp: ^^ "net.ipv4.conf.default.accept_redirects" \s* "=" \s* 0 \s* $$
regexp: ^^ "net.ipv4.conf.default.secure_redirects" \s* "=" \s* 0 \s* $$
 

note:
note: Ignore all ICMP ECHO and TIMESTAMP requests sent to it via broadcast/multicast
note:

regexp: ^^ "net.ipv4.icmp_echo_ignore_broadcasts" \s* "=" \s* 1 \s* $$
 
note:
note: Prevent against the common 'syn flood attack'
note:

regexp: ^^ "net.ipv4.tcp_syncookies" \s* "=" \s* 1 \s* $$
 
note:
note: Enable source validation by reversed path, as specified in RFC1812
note:

regexp: ^^ "net.ipv4.conf.all.rp_filter" \s* "=" \s* 1 \s* $$

note:
note: Controls source route verification
note:

regexp: ^^ "net.ipv4.conf.default.rp_filter" \s* "=" \s* 1 \s* $$ 
 
note:
note: IPv6 networking start
note:

note:
note: Number of Router Solicitations to send until assuming no routers are present.
note: This is host and not router
note:

regexp: ^^ "net.ipv6.conf.default.router_solicitations" \s* "=" \s* 0 \s* $$
 
note:
note: Accept Router Preference in RA?
note:

regexp: ^^ "net.ipv6.conf.default.accept_ra_rtr_pref" \s* "=" \s* 0 \s* $$
 
note:
note: Learn Prefix Information in Router Advertisement
note:

regexp: ^^ "net.ipv6.conf.default.accept_ra_pinfo" \s* "=" \s* 0 \s* $$
 
note:
note: Setting controls whether the system will accept Hop Limit settings from a router advertisement
note:

regexp: ^^ "net.ipv6.conf.default.accept_ra_defrtr" \s* "=" \s* 0 \s* $$
 
note:
note: Router advertisements can cause the system to assign a global unicast address to an interface
note:

regexp: ^^ "net.ipv6.conf.default.autoconf" \s* "=" \s* 0 \s* $$
 
note:
note: How many neighbor solicitations to send out per address?
note:

regexp: ^^ "net.ipv6.conf.default.dad_transmits" \s* "=" \s* 0 \s* $$
 
note:
note: How many global unicast IPv6 addresses can be assigned to each interface?
note:

regexp: ^^ "net.ipv6.conf.default.max_addresses" \s* "=" \s* 1 \s* $$
 
note:
note: IPv6 networking ends
note:
 
#note:
#note: Enable ExecShield protection
#note:

#note:
#note: Set value to 1 or 2 (recommended) 
#note:

#kernel.exec-shield = 2
#kernel.randomize_va_space=2
 
#note:
#note: TCP and memory optimization 
#note: increase TCP max buffer size setable using setsockopt()
#note:

#net.ipv4.tcp_rmem = 4096 87380 8388608
#net.ipv4.tcp_wmem = 4096 87380 8388608
 
#note:
#note: increase Linux auto tuning TCP buffer limits
#note:

#net.core.rmem_max = 8388608
#net.core.wmem_max = 8388608
#net.core.netdev_max_backlog = 5000
#net.ipv4.tcp_window_scaling = 1
 
note:
note: Increase system file descriptor limit    
note:

regexp: ^^ "fs.file-max" \s* "=" \s* 65536 \s* $$
 
note:
note: Allow for more PIDs 
note:

regexp: ^^ "kernel.pid_max" \s* "=" \s* 65536 \s* $$
 
note:
note: Increase system IP port limits
note:

regexp: ^^ "net.ipv4.ip_local_port_range" \s* "=" \s* "2000 65000" \s* $$
 
note:
note: RFC 1337 fix
note:

regexp: ^^ "net.ipv4.tcp_rfc1337" \s* "=" \s* 1 \s* $$```

# task check
```
generator: print 'hello world'
assert: 1 1 is true
generator: print  "assert: True True is <true>"
generator: print "assert: true true is true"
code: print "just a line\n"
```

# task check
```
Hello
regexp: My\s+name\s+is\s+\S+

```

# task check
```
regexp: (\d+)

generator: <<CODE
!ruby
  my_generator
CODE
```

# task check
```
generator: <<CODE
!bash
set_Foo;
echo $FOO
CODE


code: <<CODE
!bash
set_Foo;
echo "{$FOO}"
echo OK
CODE
```

# task check
```
generator: <<CODE
!bash
echo OK1
echo OK2
echo OK3
CODE
```

# task check
```
between: {A} {DONE}
B
C

generator: <<RAKU
!raku
say "assert: ", streams_array()<>.elems == 2 ?? 1 !! 0 , " streams array: found 2 streams (real value {streams_array()<>.elems})";
say "assert: ", streams().keys.elems == 2 ?? 1 !! 0 , " streams keys: found 2 streams (real value {streams().keys.elems})";
RAKU
note: =============== narrow down to DD ====================

DD


generator: <<RAKU
!raku
say "assert: ", streams_array()<>.elems == 1 ?? 1 !! 0 , " streams array: found 1 stream (real value {streams_array()<>.elems})";
say "assert: ", streams().keys.elems == 1 ?? 1 !! 0 , " streams keys: found 1 stream (real value {streams().keys.elems})";
RAKU

note: =============== narrow down to DDD ====================
~regexp: DDD

generator: <<RAKU
!raku
say "assert: ", matched().elems == 0 ?? 1 !! 0 , " matched: found 0 matched (real value {matched().elems})";
say "assert: ", streams_array()<>.elems == 0 ?? 1 !! 0 , " streams array: found 0 stream (real value {streams_array()<>.elems})";
say "assert: ", streams().keys.elems == 0 ?? 1 !! 0 , " streams keys: found 0 stream (real value {streams().keys.elems})";
RAKU

end:
```

# task check
```
state.message == hello from task2
```

# task check
```
task begins


```

# task check
```
between: { "foo" } { "bar" }
:any:
end:


generator: <<OK
!raku

my @a = streams_array()<>;

say "note: \@a[0][0]: ", @a[0][0];

say "assert: ", @a[0][0] eq "foo", " \@a[0][0] eq \"foo\"";

say "note: \@a[0][1]: ", @a[0][1];

say "assert: ", @a[0][1] eq "1", " \@a[0][0] eq \"1\"";

say "note: \@a[0][2]: ", @a[0][2];

say "assert: ", @a[0][2] eq "2", " \@a[0][2] eq \"2\"";

say "note: \@a[0][3]: ", @a[0][3];

say "assert: ", @a[0][3] eq "3", " \@a[0][3] eq \"3\"";

say "note: \@a[1][0]: ", @a[1][0];

say "assert: ", @a[1][0] eq "foo", " \@a[1][0] eq \"foo\"";

say "note: \@a[1][1]: ", @a[1][1];

say "assert: ", @a[1][1] eq "A", " \@a[1][1] eq \"A\"";

say "note: \@a[1][2]: ", @a[1][2];

say "assert: ", @a[1][2] eq "B", " \@a[1][2] eq \"B\"";

say "note: \@a[1][3]: ", @a[1][3];

say "assert: ", @a[1][3] eq "C", " \@a[1][3] eq \"C\"";

say "note: \@a[1][4]: ", @a[1][4];

say "assert: ", @a[1][4] eq "bar", " \@a[1][4] eq \"bar\"";

OK
```

# task check
```
hook says A
hook says B
task says C
task says D
```

# task check
```

regexp: FOO (.*)

within: FOO
```

# task check
```
regexp: hello 
```

# task check
```
between: {foo} {bar}

# all check expressions here
# will be applied to the range
# between /foo/ ^fff^ /bar/

hello # should match 1 time

generator: print "assert: ", ( scalar @{matched()} == 1 ? 1 : 0 ), " 1 hello within foo ... bar\n";

# reset context, end of the range context:

end:

hello # should match three times

generator: print "assert: ", ( scalar @{matched()} == 3 ? 1 : 0 ), " 3 hello within all document\n";

```

# task check
```
between: {foo} {bar}

  regexp: \d+

  code: <<CODE

    print "start {foo} {bar} range\n";

    print "apply regexp: \\d+\n";

    dump_streams();

  CODE

  generator: <<CODE


    print "assert: ", streams_array()->[0][0][0] == 0 ? 1 : 0 ," streams_array()->[0][0][0] == 0 \n";

    print "assert: ", streams_array()->[1][2][0] == 6 ? 1 : 0 ," streams_array()->[1][2][0] == 6 \n";

    print "assert: ", streams_array()->[2][1][0] == 3 ? 1 : 0 ," streams_array()->[2][1][0] == 3 \n";

    print "note: end {foo} {bar} range\n";

  CODE

end:
```

# task check
```
foo: 1
bar: 2
```

# task check
```
Hello
regexp: My \s+ name \s+ is \s+ \S+

```

# task check
```
generator: <<CODE
!perl6
  say "assert: ", config<language>.defined, ' config<language>.defined';
  say "hello world from [{config<language>}]";
CODE
```

# task check
```
# this one generator is multiline
generator: <<CODE

    print join "\n", 
    qw(               
        id              
        title           
        body            
        userId          
     )                  
CODE

# this one generator is multiline
generator: <<CODE

    print join "\n", 
    qw(
        'regexp: id',              
        'regexp: title',           
        'regexp: body',            
        'regexp: userId',          
                        
    );                             



```

# task check
```
within:  "<p" \s+ .* ">"  ( .* )  "</p>"
  code: <<RAKU
  !raku
  say captures()[0].raku; 
  RAKU
  regexp: ^^ "Click Me" $$
end:```

# task check
```
begin:
A
0
1
2
6
Z
end:

code: <<CODE
!perl6 
print "streams: "; dump_streams();
CODE
```

# task check
```
within: 'color:' \s+  red || green || blue 
  fff
  RE2
  #RE44
  RE2
end:

code: <<CODE
!perl6
  print "streams: ";
  dump_streams();
CODE
```

# task check
```
between: {foo} {bar}

  aaaa
  regexp: \S 1
  regexp: \S 222
  regexp: \S 3
  #regexp: \S 5
  #regexp: \S 1

  code:  <<CODE
  !perl6

  print "streams: ";
  dump_streams;  
  
  CODE
  
end:
```

# task check
```
OK!

```

# task check
```
task3 - read state: Alex Julia
```

# task check
```
between: {foo} {bar}

  regexp: (\d+)

  code:  <<CODE
  
    for my $s (@{streams_array()}) {
        my $i=1;
        for my $l (@{$s}){
          print "layer: ", $i++, " ", (join "", map {"{$_}"} @{$l}), "\n";
        }
      print "\n";
    }
  
  CODE

end:
```

# task check
```
within: "hello" \s+ (.*) $$

regexp: ^^ .* ( "is" \s+ \S+ ) $$

code: <<RAKU
!raku
dump_streams();
RAKU

generator: <<RAKU
!raku
say "assert: ", streams_array()<>.elems == 1 ?? 1 !! 0 , " streams array: found 1 streams (real value {streams_array()<>.elems})";
say "assert: ", streams().keys.elems == 1 ?? 1 !! 0 , " streams keys: found 1 streams (real value {streams().keys.elems})";
say "assert: ", streams_array()<>[0].elems == 2 ?? 1 !! 0 , " streams array: layer1 found 2 elems (real value {streams_array()<>[0].elems})";
RAKU

```

# task check
```
done
```

# task check
```
generator: <<GENE
!python
print('PYTHON SIMPLE STORY')
GENE
```

# task check
```
OK2

```

# task check
```
regexp: (\d+)


code: <<CODE
!ruby

  captures.each do |c|
    puts "# #{c.first}"
  end

CODE

code: <<CODE
!ruby

  foo

CODE
```

# task check
```
generator: <<CODE
!ruby
puts "main.foo: #{config['main']['foo']}"
CODE
```

# task check
```
bar
```

# task check
```
generator: <<CODE
!perl6
  say "regexp: ^^ '[{config()<args>}]' \$\$"
CODE
```

# task check
```
main.foo: 1

```

# task check
```
between: {foo} {bar}

  regexp: (A)(A)(A)
  regexp: \d
  regexp: (\d)(\d)(\d)
  regexp: (\d)
  
  code: <<CODE
    !raku
    say "foo .. bar start";
    say "apply regexp: (A)(A)(A)";
    say "apply regexp: \\d";
    say "apply regexp: (\\d)(\\d)(\\d)";
    say "apply regexp: (\\d)";
  
    dump_streams();
    use Data::Dump;
    say Dump(streams_array());  

  CODE
  
  generator: <<CODE
  !raku
  
    say "note: start stream check ...";

    my @streams = streams().keys;
  
    say "assert: ", ( @streams.elems == 2 ?? 1 !! 0 ), " 2 streams found (as hash)";
  
    @streams =  streams_array()<>;
  
    say "assert: ", ( @streams.elems == 2 ?? 1 !! 0 ), " 2 streams found (as array, real value {@streams.elems})";
  
    my $i = @streams[0][0][0];
  
    say "assert: ", $i eq 'A' ?? 1 !! 0 , " stream[1,0,0](real value $i) == A \n";
  
    $i = @streams[0][1][0];
  
    say "assert: ", $i ~~ /^^ \s+ 00 \s* $$/ ?? 1 !! 0 , " stream[1,1,0](real value $i) ~~ 00";
  
    $i = @streams[0][2][0];
  
    say "assert: ", $i ~~ /^^ \s+ 111 \s* $$/ ?? 1 !! 0 , " stream[1,2,0](real value $i) ~~ $i";

    say "note: start stream end ...";
  
  CODE
  
end:
```

# task check
```
note: between: {start} {end}
between: {start} {end}

regexp: (\d+)

code: <<RAKU
!raku
use Data::Dump;
say captures();
say Dump(streams());
RAKU


generator: <<RAKU
!raku
say "assert: ", captures().elems == 12 ?? 1 !! 0, " 12 captures";
say "assert: ", captures()[0][0] == 100 ?? 1 !! 0, " first cap is 100";
say "assert: ", captures()[11][0] == 12 ?? 1 !! 0, " last cap is 12";

RAKU

end:

note: context reset

regexp: (\d+)

generator: print 'assert: ',( scalar @{captures()} == 15 ), ' 15 numbers total';
generator: print 'assert: ',( captures->[0]->[0] == 100 ), ' first number is 100';
generator: print 'assert: ',( captures->[1]->[0] == 0 ), ' second number is 0';
generator: print 'assert: ',( captures->[2]->[0] == 3 ), ' third number is 3';
generator: print 'assert: ',( captures->[3]->[0] == 4 ), ' forth number is 4';
generator: print 'assert: ',( captures->[4]->[0] == 5 ), ' fifth number is 5';
generator: print 'assert: ',( captures->[14]->[0] == 73 ), ' last (15-th) number is 73';
generator: print 'assert: ',! defined captures->[15], ' 16-th number is not defined';

```

# task check
```
OK2
regexp: ( ( OK ) ( \d+ ) )
```

# task check
```
generator: <<CODE
!perl6
say "assert: ", ( defined(config()<main><foo>) ?? 1 !! 0 ), " config.main.foo defined"
CODE

generator: <<CODE
!perl6
say "value=\{{config()<main><foo>}\}"
CODE
```

# task check
```
hello from powershell
```

# task check
```
Hello, World!```

# task check
```
hello from powershell
```

# task check
```
pong
```

# task check
```
begin:
===
delectus aut autem
===
end:

```

# task check
```
hello from powershell
```

# task check
```
generator: <<CODE
print join "\n", ( 'H', 'E', 'L', 'O' );
CODE
```

# task check
```
within: 'color:' \s+  red || green || blue 
  RE2
  #RE44
  RE2
end:

code: <<CODE
!perl6
  dump_streams();
CODE
```

# task check
```
generator: <<CODE
!bash
bash_rocks
CODE
```

# task check
```
hello from perl6
```

# task check
```
between: {foo} {bar}

  regexp: (1)(1)
  
  code: <<CODE
  
    print "foo .. bar start\n";
    print "apply regexp: (1)(1)\n";
  
    dump_streams();
  
  CODE
  
  regexp: (2+)
  
  code: <<CODE
  
    print "apply regexp: (2+)\n";
  
    dump_streams();
  
    print "foo .. bar end\n";
  
  CODE
  
end:
```

# task check
```
assert: 1 'this is ever true one'
assert: 1  this is ever true two
generator: print "assert: 1 'this is ever true three'" 
generator: print "assert: 1 this is ever true four" 
generator: print "assert: 1 'this is ever true five'"
generator: print "assert: 1 this is ever true six"
```

# task check
```
note: =============================================

between: { '/var/log/mariadb/mariadb.log' \s+ '{' \s* $$ } { ^^ \s* '}'  \s* $$}
  note: look up /var/log/mariadb/mariadb.log postrotate section
  postrotate
end:

generator: <<RAKU
!raku
#say "note: ", captures-full();
if matched().elems {
  my $start = captures-full()[0]<index>;
  say "note: postrotate section found";
  #say "note: \{ :{$start}: \} \{ endscript \}";
  say "between: \{ :{$start}: \} \{ endscript \}";
  say "note: look up mysqladmin flush-logs";
  say "/usr/bin/mysqladmin flush-logs";
  say "end:";
}
RAKU


between: { '/var/log/logstash-forwarder/*.err' \s+ '{' \s* $$ } { ^^ \s* '}'  \s* $$}
  note: look up /var/log/logstash-forwarder/*.err postrotate section
  postrotate
end:

note: =============================================

generator: <<RAKU
!raku
#say "note: ", captures-full();
if matched().elems {
  my $start = captures-full()[0]<index>;
  say "note: postrotate section found";
  #say "note: \{ :{$start}: \} \{ endscript \}";
  say "between: \{ :{$start}: \} \{ endscript \}";
  say "note: look up logstash-forwarder/*.err restart command";
  say "service logstash-forwarder restart";
  say "end:";
}
RAKU

between: { '/var/log/mariadb/mariadb.log' \s+ '{' \s* $$ } { ^^ \s* '}'  \s* $$}
  note: look up /var/log/mariadb/mariadb.log rotate parameter
  regexp: ^^ \s* rotate \s+ (\d+) \s* $$
  regexp: ^^ \s* rotate \s+ (\d+) \s* $$

end:

code: <<RAKU
!raku
say matched()
RAKU

generator: <<RAKU
!raku
#say "note: ", captures-full();
if matched().elems {
  my $num = captures[0][0];
  say "note: rotate param found, value = $num";
  if $num > 1 {
    say "assert: 1 rotate > 1"
  } else {
    say "assert: 0 rotate > 1"
  }
} else {
  say "note: rotate param not found";
}
RAKU```

# task check
```
hello param == php
```

# task check
```
generator: <<RAKU
!raku
use NginxParser;
gene();
RAKU

```

# task check
```
generator: <<CODE

print "assert: ", defined(config()->{main}->{foo}), " config.main.foo defined\n";
print  "main.foo = [", config()->{main}->{foo}, "]";
CODE
```

# task check
```
generator: <<CODE
!ruby
puts config['main']['foo']
CODE
```

# task check
```
note: negations in blocks

begin:
A
!regexp: D
C
]
!regexp: D
A
end:


note: negations for single strings
!regexp: Ok

note: negations inside ranges, example #1
note: between: {'['} {']'}
between: {'['} {']'}
  A
  B
  !regexp: D
  C
end: 

note: negations inside within, example #2
within: "A B" 
!regexp: F
C
end:

note: negations inside ranges, example #3
note: between: {'['} {']'}
between: {'['} {']'}
  !regexp: D
  !regexp: D
  A
end:

begin:
!regexp: H
end:
```

# task check
```
note: negations in blocks, exmaple #1

begin:
regexp: OK
!regexp: ok
!regexp: kO
!regexp: oo
!regexp: kk
Hello
done
end:


note: negations for single strings, example #2
!regexp: Ok

note: negations inside ranges
note: between: {OK} {done}
between: {OK} {done}
  !regexp: HELLO
  Hello
end: 
```

# task check
```
code: <<GENE
!python
print("OK")
import sys
sys.stdout.write('PYTHON DEBUG MESSAGE')
GENE
```

# task check
```
begin:
1
2
3
end:

```

# task check
```
begin:

    regexp: (f) (oo)

    code: print "layer: 1 ", ( join "", map { map {"{$_}"} @{$_}} @{captures()} ), "\n";

    regexp: (\S+)

    code: print "layer: 2 ", ( join "", map { map {"{$_}"} @{$_}} @{captures()} ), "\n";

    regexp: (\S+)

    code: print "layer: 3 ", ( join "", map { map {"{$_}"} @{$_}} @{captures()} ), "\n";

    regexp: (\S+)

    code: print "layer: 4 ", ( join "", map { map {"{$_}"} @{$_}} @{captures()} ), "\n";

    regexp: (bar)

    code: print "layer: 5 ", ( join "", map { map {"{$_}"} @{$_}} @{captures()} ), "\n";

    code:  <<CODE

      for my $s (@{streams_array()}) {
          my $i=1;
          for my $l (@{$s}){
            print "layer: ", $i++, " ", (join "", map {"{$_}"} @{$l}), "\n";
          }
        print "\n";
      }

    CODE

end:

```

# task check
```
between: {foo} {bar}
  regexp: (foo \d+)
  code: <<CODE
  !perl6 
    say captures().perl;
  CODE
end:
```

# task check
```
generator: print "I AM OK"
```

# task check
```
between: {OK} {DONE}
    ~regexp: HOWAREYOU \s+ (\d+)
end:

code: <<RAKU
!raku
if matched() {
    my $ln = captures-full()[0]<index>;
    my $num = capture()[0].Int;
    $num++;
    replace("{cache_root_dir()}/file.txt",$ln,"BYE $num");
}
RAKU

code: <<BASH
!bash
cat $cache_root_dir/file.txt
BASH
```

# task check
```
generator: <<CODE
  !bash
    echo Say
    echo Hello
    echo 'regexp: Hello || Again'
CODE

```

# task check
```
generator: <<CODE
!raku
my $s = get_state();
my $name = $s<name>;
say "note: found name: $name";
say "assert: ", $name.defined, " name is not null";
$s<hello> = "Raku";
update_state($s)
CODE

generator: <<CODE
!raku
my $s = get_state();
my $hello = $s<hello>;
say "note: found hello: $hello";
say "assert: ", $hello.defined, " hello is not null";
CODE
```

# task check
```
OK

note: === change source ===

source: /tmp/file1.txt
regexp: ^^ A1 $$
B1
C1

note: === change source ===

source: /tmp/file2.txt
regexp: ^^ A2 $$
B2
C2


note: === remove second line from /tmp/file1.txt  ===

code: <<OK
!raku
remove-line("/tmp/file1.txt",1)
OK

note: === change source ===

source: /tmp/file1.txt

begin:
A1
C1
end:

```

# task check
```
code: <<CODE
  !perl
  print "hello world!\n";
CODE
```

# task check
```
KO
```

# task check
```
KO
```

# task check
```
generator: <<CODE
!python
print("regexp: (\d+)\w")
CODE

generator: <<CODE
!python
from sparrow6lib import *
import pprint
pp = pprint.PrettyPrinter(indent=4)
print(capture()[0])

#if (capture()[0] == '1'):
#  print "assert: 1 first capture is 1"
#else:
#  print "assert: 0 first capture is 1"

#if (captures()[1][0] == '2'):
#  print "assert: 1 second capture is 2"
#else:
#  print "assert: 0 second capture is 2"

#if (captures()[2][0] == '3'):
#  print "assert: 1 third capture is 3"
#else:
#  print "assert: 0 third capture is 3"



CODE

```

# task check
```
task begins


```

# task check
```
I am OK
I am Sparrow6
```

# task check
```
hello

regexp: ((h) (e))

generator: <<CODE
!perl
use Data::Dumper;
print config()->{main}->{foo};
CODE

regexp: (h) (e)

code: <<CODE
!perl
use Data::Dumper;
print "OK\n";
print Dumper(captures());
print "OK\n";
CODE
```

# task check
```
# date should be in format
within: \d\d\d\d '-' \d\d '-' \d\d

  # should be 2000 year
  regexp: ^^ '2000-'

  # should be 04 month
  regexp: '-04'

  01

end:
```

# task check
```
HELLO
regexp: \d\d\d\d "-" \d\d "-" \d\d

```

# task check
```
Sparrow6

```

# task check
```
between: {OK} {DONE}
    regexp: HELLO \s+ (\d+)
end:

code: <<RAKU
!raku
if matched() {
    my $ln = captures-full()[0]<index>;
    my $num = capture()[0].Int;
    $num++;
    replace("{cache_root_dir()}/file.txt",$ln,"BYE $num");
}
RAKU

code: <<BASH
!bash
cat $cache_root_dir/file.txt
BASH
```

# task check
```
good bye!
```

# task check
```
between: { "hello2" } { :5: }
    }
    hello2
    done
end:

code: <<RAKU
!raku
say matched();
dump_streams();
RAKU


```

# task check
```
between: { :1: } { :3: }
hello
end:

code: <<RAKU
!raku
say matched();
dump_streams();
RAKU


begin: 
:2:
hello2
end:


within: :3:
end:

code: <<RAKU
!raku
say matched();
RAKU
```

# task check
```
OK

code: <<RAKU
!raku
use Data::Dump;
for captures-full() -> $s {
  say $s;
}
RAKU


begin:
HELLO
!regexp: OK2
:3:
!regexp: OK3
:5:
BYE!!!
end:
```

# task check
```
note: verify thing as email

note: verify local-part

within: ^^ (.*) \@ <[ a .. z 0 .. 9 \- ]>+ \s* $$

note: find quote symbol symbols 

~regexp: <!before \\> (\")

code: <<RAKU
!raku
for captures() -> $c {
    say "note: quote symbol found: ", $c.raku;
}
RAKU 
```

# task check
```
begin:
1
2
3
end:
```

# task check
```
:any:

code: <<RAKU
!raku

use Data::Dump;

say Dump(captures-full());

RAKU

generator: <<RAKU
!raku

say "assert: ", captures().elems == 1 ?? 1 !! 0, " captures list has 1 element";

RAKU
```

# task check
```
:any:```

# task check
```
CASCADE

code: <<RAKU
!raku
use Data::Dump;

say Dump(captures-full());

RAKU```

# task check
```
within: ^^ A (\S+) A $$
regexp: ^^ B (\S+) B $$
regexp: ^^ C (\S+) C $$
regexp: ^^ D $$
end:```

# task check
```
between: {Foo} {Bar}

  # here will be everything
  # between foo and bar lines
  
  regexp: (\d+)
  
  code: <<CODE
  
    print "Foo .. Bar start\n";
    print "apply regexp: (\\d+)\n";
  
    dump_streams();
  
    print "Foo .. Bar end\n";
  
  CODE

end:

between: {fooo} {baaar}

  # here will be everything
  # between fooo and baaar lines
  # NOT necessarily inside foo bar block 

  regexp: (\d+)

  code: <<CODE

    print "fooo .. baaar start\n";
    print "apply regexp: (\\d+)\n";

    dump_streams();

    print "fooo .. baaar end\n";

  CODE

```

# task check
```
regexp: (\d+)

code: <<CODE
!perl6

say  captures.perl

CODE

generator: <<CODE
!perl6

  say "assert: ", capture[0] == 1, " capture[0] == 1";
  say "assert: ", captures[0][0] == 1, " captures[0][0] == 1";
  say "assert: ", captures[1][0] == 2, " captures[1][0] == 2";
  say "assert: ", captures[2][0] == 3, " captures[2][0] == 3";

CODE

```

# task check
```
HELLO
regexp: \d\d\d\d '-' \d\d '-' \d\d

```

# task check
```
~regexp: ^^ \s* "MODULES=(" (.*) ")" \s* $$
generator: <<CODE
!raku
if !matched() {
   # fail check if no MODULES= section found 
   say "assert 0 MODULES= section found";
} else {
   my $path = config()<path>;
   say "note: ", capture().raku;
   #my @mods = capture()[0].split(/s+/);
   #@mods.push("zfs") unless "zfs" (elem) @mods;
   # probably other mods manipulations
   # and then update configuration
   say "note: patch $path";
   #replace(
   #  $path,
   #  captures-full()[0][0]<index>,
   #  "MODULES=({@mods.join(" ")})",
   #);
}
CODE
```

# task check
```
begin:

    foo
    regexp: \S+
    regexp: \S+
    regexp: \S+
    bar

    code: dump_streams()

end:

begin:

    foo

        regexp: (\S+)

        generator: <<CODE

          my $cpt = join ' ', map {$_->[0]} @{captures()};

          print 'assert: ', $cpt eq 'a 1 0 .' ? 1 : 0 , " captures($cpt) == 'a 1 0 .' \n";
  
        CODE

        regexp: (\S+)

        #code: use Data::Dumper; print Dumper(captures());

        generator: print 'assert: ', ( join ' ', map {$_->[0]} @{captures()} ) eq 'b 2 00 ..' ? 1 : 0 , " captures == 'b 2 00 ..' \n";

        regexp: (\S+)
        generator: print 'assert: ', ( join ' ', map {$_->[0]} @{captures()} ) eq 'c 3 000 ...' ? 1 : 0 , " captures == 'c 3 000 ...' \n";

    bar


    generator: <<CODE
    my @streams = @{streams_array()};
    print "note: stream3,1,1: $streams[2]->[0]->[0]\n";
    print "assert: ",( $streams[2]->[0]->[0] =~ m/^\s*foo\s*$/ ? 1 : 0 ), " stream3,1,1 == foo\n";
    print "note: stream3,2,1: $streams[2]->[1]->[0]\n";
    print "assert: ",( $streams[2]->[1]->[0] == 0 ? 1 : 0 ), " stream3,2,1 == 0\n";
    print "note: stream3,3,1: $streams[2]->[2]->[0]\n";
    print "assert: ",( $streams[2]->[2]->[0] eq '00' ? 1 : 0 ), " stream3,3,1 == 00\n";
    CODE
    
end:

```

# task check
```
HELLO

```

# task check
```
I am OK
#I am ok

```

# task check
```
code: <<CODE
!perl
print 'hello world!!!';
CODE


generator: <<CODE
!perl
print 'OK' ;
CODE
```

# task check
```
alex
hello
world
julia
alex


begin:

  hello
  world

  code: dump_streams();

  generator: <<CODE

    print "assert: ",  scalar(@{streams_array()}) == 2, " 2 streams found so far\n";
    print "assert: ",  streams_array()->[0]->[0]->[0] eq 'hello', " stream0,0,0 == hello\n"; 
    print "assert: ",  streams_array()->[1]->[0]->[0] eq 'hello', " stream1,0,0 == hello\n";

  CODE

  jan

  generator: print "assert: ",  scalar(@{streams_array()}) == 1 ? 1 : 0, " 1 stream found so far\n";

  code: dump_streams();

  julia
  alex

  generator: <<CODE

    print "assert: ",  scalar(@{streams_array()}) == 1 ? 1 : 0, " 2 streams found so far\n";
    print "assert: ",  streams_array()->[0]->[0]->[0] eq 'hello' ? 1 : 0, ' stream0,0.0', "\n"; 
    print "assert: ",  streams_array()->[0]->[1]->[0] eq 'world' ? 1 : 0, ' stream0,1,0', "\n"; 

  CODE

end:

begin:

  regexp: (a(\d+))

  code: use Data::Dumper; print Dumper(capture());

  generator: print "assert: ", capture->[0] eq 'a1' ? 1 : 0, " capture0 eq a1\n"; 

  regexp: (b(\d+))

end:


begin:

  regexp: hel.*
  regexp: wor.*
  regexp: jan

end:
```

# task check
```
within: 'Colors:' \s red
  red
end:

within: 'Digits:'

  one-
  regexp: \d\d
  regexp: 1+

end:

within: Colors:
  blue
end:

```

# task check
```
within: Jack
1080p
!regexp: Highlights
end:

generator: <<OK
!raku
for streams_array()<> -> $i {
   say "assert: ", $i.tail.head ~~ /\S+/ ?? True !! False, " i.tail.head is not empty" ;
}
OK
```

# task check
```
regexp: \d

code: <<CODE

use Data::Dumper;

print Dumper(matched());

CODE

generator: <<CODE
  my @matched = @{matched()};
  print "note: $matched[0]\n";
  print "assert: ", $matched[0] eq "1 one" ? 1 : 0, " matched0 eq '1 one'\n";
  print "note: $matched[1]\n";
  print "assert: ", $matched[1] eq "2 two" ? 1 : 0, " matched1 eq '2 two'\n";
  print "note: $matched[2]\n";
  print "assert: ", $matched[2] eq "3 three" ? 1 : 0, " matched2 eq '3 three'\n";
CODE
```

# task check
```
begin:
  foo
  regexp: \S+
  regexp: \S+
  regexp: \S+
bar

code: dump_streams();

end:
```

# task check
```
task status: 1
task path: 01
task vars: hello world
check0 status: 1
check0 message: text has 'foo: hello world'
```

# task check
```
regexp: host:(.*)
code: [print(capture()->[0])]
```

# task check
```
OK

generator: our @foo; [ "assert: ".($foo[1] eq  'foo was here' ? 1 : 0 ). ' foo was here'];
generator: our @foo; [ "assert: ".($foo[2] eq  'bar was here' ? 1 : 0 ). ' bar was here'];



```

# task check
```
/foo/bar/logs


```

# task check
```
generator: <<HERE
!bash
echo '{' $USER '}'
HERE


```

# task check
```
within: red
regexp: (\d+)

validator: [(capture()->[0] == 1), 'red should be first']


within: green
regexp: (\d+)

validator: [(capture()->[0] > 1), 'green should be after red']
```

