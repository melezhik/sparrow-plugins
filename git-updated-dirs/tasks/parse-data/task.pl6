my @list;
my %seen;

my $dir = config()<dir>;
my $level = config()<level>;

for "{cache_root_dir()}/git.data".IO.lines -> $i {

  my @c = $i.split(/\s+/)[1].split('/');

  next if @c.elems < $level+1;

  my $p = @c[0 .. $level].grep({/\S+/}).join("/");

  say "handle line: $i => $p";
  if ! %seen{$p} && "$dir/$p".IO ~~ :d {
    %seen{$p}++;
    @list.push($p);
    say "push $p to the list";
  }
}

update_state %( list => @list )
