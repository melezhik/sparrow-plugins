use v6;
use System::Stats::MEMUsage;    

my %mem = MEM_Usage();

say "Total: %mem<total> bytes";
say " Free: %mem<free> bytes";
say " Used: %mem<used> bytes";
say "Usage: %mem<usage-percent>";
