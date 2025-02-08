use Template6;

my $t6 = Template6.new;

say "template: {config()<template_dir>}/{config()<template>}.tt ...";
say "wrtting result to target: {config()<target>} ...";

$t6.add-path: config()<template_dir>;
my %vars = config()<vars>;
"{cache_root_dir()}/{config()<template>}.out".IO.spurt(
  $t6.process(
    config()<template>,
    |%vars,
  ),
);
