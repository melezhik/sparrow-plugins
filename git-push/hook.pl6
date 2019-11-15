#!perl6


if os() eq 'windows' {

  run_task("{os()}");

} else {

  run_task("linux");

}

