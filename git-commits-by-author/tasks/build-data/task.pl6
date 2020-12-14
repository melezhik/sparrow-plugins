my %list;

for "{root_dir()}/stat.txt".IO.lines -> $i {

  if $i ~~ /^^ \s* (\d+) \s+ (.*) \s+ '<' (.*?) '>'  / {

    my $cnt = "{$0}";
    my $author = "{$1}"; 
    my $email = "{$2}".lc;
  
    if %list{$email}:exists {
      %list{$email} += + $cnt;
    } else {
      %list{$email} = %(
        cnt => + $cnt,
        author => $author,
      );
    }
    #say "process $i";
  }
}

say %list.perl;

my @list;

for %list.keys -> $e {
  push @list, %(
    cnt => %list{$e}<cnt>,
    email => $e,
    author => %list{$e}<author>,
  )

}

say @list.perl;

update_state %( list => [] ) ;
