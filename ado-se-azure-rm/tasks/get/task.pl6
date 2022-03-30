use Curlie;
use JSON::Tiny;

my %conf = EVALFILE("{%*ENV<HOME>}/.ado-auth.raku");

my $password = %conf<token>;
my $api = %conf<api>;
my $project = %conf<project> || config()<project>;

my \c = Curlie.new(:username<raku>, :$password);

say "OK";

c.get("{$api}/{$project}/_apis/serviceendpoint/endpoints/{config()<id>}?api-version=6.0-preview.4") 

or die c.res;

update_state(c.res.json);


