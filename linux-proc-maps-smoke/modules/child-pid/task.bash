(sleep 1) &
export pid=$!

perl -e 'use Linux::Proc::Maps qw(read_maps); 
print read_maps(pid => $ENV{pid})->[0]->{pathname};
'

