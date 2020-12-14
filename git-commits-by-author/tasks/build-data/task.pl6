my %list;

for "{cache_dir()}/stat.txt".IO.lines -> $i {

  if $i ~~ /^^ \s* (\d+) \s+ (.*) \s+ '<' (.*?) '>'  / {

    my $commits = "{$0}";
    my $author = "{$1}"; 
    my $email = "{$2}".lc;
  
    if %list{$email}:exists {
      %list{$email}<commits> += + $commits;
    } else {
      %list{$email} = %(
        commits => + $commits,
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
    commits => %list{$e}<commits>,
    email => $e,
    author => %list{$e}<author>,
  )

}

say @list.perl;

update_state %( list => @list );
