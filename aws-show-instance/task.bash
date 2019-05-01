id=$(config id)


aws ec2 describe-instances --instance-id $id \
--query 'Reservations[*].Instances[*].{
ID:InstanceId,St:State,Time:LaunchTime,IP:PublicIpAddress,IP2:PrivateIpAddress,Tags:Tags,Devices:BlockDeviceMappings,Subnet:SubnetId,AZ:Placement.AvailabilityZone }' | perl -n -MJSON -e '
$json.=$_;
  END {
    #print $json;
    my $ii = decode_json($json);
    for $i (map {$_->[0]} @$ii){
      write();
    }
  }


format STDOUT  =
----------------------------------------------------------------------------------------------------------------
ID                        Public IP           Private IP                 Time                  State
----------------------------------------------------------------------------------------------------------------
@<<<<<<<<<<<<<<<<<<<<<<<< @<<<<<<<<<<<<<<<<<< @<<<<<<<<<<<<<<<<<<<<<     @>>>>>>>>>>>>>>>>>>   @<<<<<<<<<<<<<<<<< ~
$i->{ID},  $i->{IP}||'Null', $i->{IP2}||'Null', $i->{Time}, join "/", ($i->{St}{Code}, $i->{St}{Name})
----------------------------------------------------------------------------------------------------------------
@<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
"Subnet: ".($i->{Subnet})
@<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
"AvailabilityZone: $i->{AZ}"
---------------------------------------------------------------/
Tags:
@*
join "\n", map { ($_->{Key})." : ".($_->{Value}) } @{$i->{Tags}}
---------------------------------------------------------------/
EBS:
@*
join "\n", map { ($_->{DeviceName})." => ".( $_->{Ebs}->{VolumeId} ) } grep {$_->{Ebs}} @{$i->{Devices}}
---------------------------------------------------------------/
.

'
