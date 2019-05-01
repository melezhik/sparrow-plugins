set -e

file=$(config file)
dest=$(config dest)

echo dest dir: $dest ...

cd $dest 

awk '
      /^define host/{f=1; str=$0; next} 
      /host_name/{ h=$NF".cfg" }
      f{ str=str ORS $0 }
      f && /^\}/{print "#"h>h;  print str>h; str=f="";  close(h)}
    ' $file
