use Text::Password::SHA;

my $len = config()->{len};
my $pwd = Text::Password::SHA->new(); 

print "password: ";
print $pwd->nonce($len+0);
print "\n\n";
