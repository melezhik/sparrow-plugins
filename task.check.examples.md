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

regexp: ^^ "net.ipv4.tcp_rfc1337" \s* "=" \s* 1 \s* $$
```

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
end:
```

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
Hello, World!
```

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
RAKU
```

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
:any:
```

# task check

```
CASCADE

code: <<RAKU
!raku
use Data::Dump;

say Dump(captures-full());

RAKU
```

# task check

```
within: ^^ A (\S+) A $$
regexp: ^^ B (\S+) B $$
regexp: ^^ C (\S+) C $$
regexp: ^^ D $$
end:
```

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

