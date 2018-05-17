set -e

app_service=$(config app_service)

group=$(config group)

echo "================================================="
echo "AppService: ${app_service}"
echo "ResourceGroup: ${group}"
echo "================================================="


az webapp config appsettings list  -n "${app_service}"  -g  "${group}" -o json | perl -MJSON -e '
  my $str = join "", <STDIN>;
  my $d = decode_json($str);
  for $i ( sort {$a->{name} cmp $b->{name} } @{$d} ){
    write
  }

format STDOUT = 
^>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  @*
"[$i->{name}]" , $i->{value}
.
'

