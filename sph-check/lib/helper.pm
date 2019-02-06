package helper;
use JSON;

use base 'Exporter';

our @EXPORT = ( 'sph_user' , 'sph_token' );

my $sph_json;

if (-e  "$ENV{HOME}/sparrowhub.json" ) {
  local $/;
  open( my $fh, '<', "$ENV{HOME}/sparrowhub.json" );
  $json_text   = <$fh>;
  $sph_json = decode_json( $json_text );  
}

sub sph_user { $sph_json->{'user'} } 

sub sph_token { $sph_json->{'token'} } 


1;
