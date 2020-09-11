use v6;

use System::Stats::DISKUsage;

my %diskUsage = DISK_Usage();

say "\nDisk Usage per second:\n";
say "Drive BytesRead BytesWritten\n";

for %diskUsage.sort(*.key)>>.kv -> ($drive, $usage) {

	printf "%-5s %-9d %-d\n", $drive, $usage<bytesreadpersec>, $usage<byteswrittenpersec>;

}


