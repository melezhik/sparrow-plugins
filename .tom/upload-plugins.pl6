#!perl6

bash "cd set-mysql && s6 --upload --verbose", %(
  description => "upload plg"
);

