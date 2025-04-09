unit module Parser;

our sub parse-message($type) is export {

  say q:to /CODE/.subst("%type%",$type,:g);

  #note: "parse-message(%type%)"

  between: { [ "message" || "enum" ] \s+ "%type%" } { ^^ \s* "}" \s* $$ }
  :any:
  end:


  code: <<RAKU
  !raku
  for matched().flat -> $i {
    say $i;
  }
  RAKU

  CODE

  say collect-message-subtypes($type);

  say q:to /CODE/;
  generator: <<RAKU
  !raku
  use Parser;
  if get_state()<subtypes> {
    for get_state()<subtypes><> -> $s {
      parse-message($s);
    }
  }
  RAKU
  CODE
}


sub collect-message-subtypes ($type) {

  q:to /CODE/.subst("%type%",$type,:g);

  #note: "collect-message-subtypes(%type%)"

  between: { "message" \s+ "%type%" } { ^^ \s* "}" \s* $$ }
  ~regexp: \s (<[A..Z]> \S+) \s+ \S+ \s+ "=" \s+ \d+ \s* ";" \s* $$
  end:


  code: <<RAKU
  !raku
  my @subtypes = Array.new();

  for captures().flat -> $i {
    #say "note: ", $i[0];
    @subtypes.push: $i[0];
  }

  update_state(%(subtypes => @subtypes ));
  RAKU

  CODE

}
