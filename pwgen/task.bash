#!bash
set -e;
export len=$(config len);
echo -n "password: "
perl -MText::Password::SHA -e 'my $pwd = Text::Password::SHA->new(); print $pwd->nonce($ENV{len}+0)';
echo;
echo;
