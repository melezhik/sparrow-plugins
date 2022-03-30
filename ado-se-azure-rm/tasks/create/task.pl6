use Curlie;
use JSON::Tiny;
use Data::Dump;

my %conf = EVALFILE("{%*ENV<HOME>}/.ado-auth.raku");

my $password = %conf<token>;
my $api = %conf<api>;

my \c = Curlie.new(:username<raku>, :$password);

my %json = (
  data =>  {
    subscriptionId =>  config()<subscription><id>,
    subscriptionName =>  config()<subscription><name>,
    environment =>  "AzureCloud",
    scopeLevel =>  "Subscription",
    creationMode =>  "Manual",
    azureSpnRoleAssignmentId => "",
    azureSpnPermissions => "",
    spnObjectId => "",
    appObjectId => "",
  },
  description => "fff",
  name =>  config()<name>,
  type =>  "azurerm",
  url =>  "https://management.azure.com/",
  authorization =>  {
    parameters =>  {
      tenantid =>  config()<sp><tenant-id>,
      serviceprincipalid =>  config()<sp><id>,
      authenticationType =>  "spnKey",
      serviceprincipalkey =>  config()<sp><key>,
    },
    scheme =>  "ServicePrincipal",
  },
  isShared =>  False,
  isReady =>  True,
  # owner => "Library",
  serviceEndpointProjectReferences => [
    {
      projectReference =>  {
        id => config()<project><id>,
        name =>  config()<project><name>
      },
      name => config()<name>,
    }
  ],
);

say Dump(%json);

c.post("{$api}/_apis/serviceendpoint/endpoints?api-version=7.1-preview.4", json => %json ) or say c.res;

#say from-json($res).perl;
