set -e

app=$(config app)

echo "generate $app"

cat << 'HERE' > $app
#!raku

use Cro::HTTP::Server;
use Cro::HTTP::Router;
use Cro::WebApp::Template;

my $application = route { 

  get  {
    template 'templates/main.crotmp', {
      message => "hello cro"
    }
  }
}

my Cro::Service $service = Cro::HTTP::Server.new:
    :host<0.0.0.0>, :port<5000>, :$application;

$service.start;

react whenever signal(SIGINT) {
    $service.stop;
    exit;
}
HERE

echo "generate templates"

mkdir -p templates

echo "<.message>" > templates/main.crotmp
