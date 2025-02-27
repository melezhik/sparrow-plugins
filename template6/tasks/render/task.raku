use Template6;

my $t6 = Template6.new;

say "template: {config()<template_dir>}/{config()<template>}.tt ...";
say "writing result to target: {config()<target>} ...";

if config()<content> {
  say "template: read template from string";
  $t6.add-template: config()<template>, config()<content>;
} else {
  say "template: read template from file ({config()<template>}.tt)";
  $t6.add-path: config()<template_dir>;
}
 
my %vars = config()<vars>;
"{cache_root_dir()}/{config()<template>}.out".IO.spurt(
  $t6.process(
    config()<template>,
    |%vars,
  ),
);
