use Data::Dump;
use Terminal::Table;

my @report = ( ["name", "value"], );

my @list;

my $data = get_state()<value>.grep({$_<name> eq config()<name> })[0];

say Dump($data) if config()<debug>;

my $group-name = $data<name>;
my $group-id = $data<id>;

for $data<variables>.keys -> $n {
  if config()<only> {
    next unless grep $n, config()<only>
  }
  @report.push: [ $n, $data<variables>{$n}<value> || ( $data<variables>{$n}<isSecret> ?? "***" !! '' ) ];
  @list.push: [ name => $n, value => $data<variables>{$n}<value> ];
}


say "project: {config()<project>} | group name: {$group-name} | group id: {$group-id}";
say "===================================================================================";

print-table(@report);

update_state %( list => @list );
