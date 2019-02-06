name=$(config name)

aws autoscaling describe-launch-configurations --launch-configuration-name $name | perl -n -MJSON -e '

  $json.=$_;

  END {
    #print $json;
    $data = decode_json($json);
    $i = $data->{LaunchConfigurations}->[0] or die "launch configuration not found";
    $name = $i->{LaunchConfigurationName};
    $instance_monitoring = $i->{InstanceMonitoring}->{Enabled} ? "YES" : "NO";
    $image_id = $i->{ImageId};
    $time = (split /T/, $i->{CreatedTime})[0];
    $in_type = $i->{InstanceType};
    @sg = @{$i->{SecurityGroups}};
    $key_name = $i->{KeyName};
    write();

  }


format STDOUT  =
----------------------------------------------------------------------------------------------------------
Name      /      Instance      /    ImageID     /      Time   /    Instance     /      KeyName           |
                Monitoring                                           Type                                |
----------------------------------------------------------------------------------------------------------
^<<<<<<<<<<<   ^<<< ~              ^<<<<<<<<<<<<<<<<  @<<<<<<<<<< @<<<<<<<<<<<<<<<<   ^<<<<<<<<<<        
$name, $instance_monitoring, $image_id, $time, $in_type, $key_name
^<<<<<<<<<<<  ~                                                                       ^<<<<<<<<<<       
$name, $key_name
----------------------------------------------------------------------------------------------------------
Securty Groups:
@<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ~~
shift @sg
----------------------------------------------------------------------------------------------------------
.

'



