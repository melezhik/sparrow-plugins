COUNTER=1
lines=$(config lines)
cpan_mirror=$(config cpan_mirror)

if [ -t 0 ]; then

    # check if metacpan api alive ...
    if ! curl -I -s -f -k https://fastapi.metacpan.org/v1; then
       run_task url-alert url https://fastapi.metacpan.org/v1
       exit 
    fi

    # check if cpan mirror available ...
    if ! curl -I -s -f $cpan_mirror/02packages.details.txt; then
       run_task url-alert url $cpan_mirror/02packages.details.txt
       exit 
    fi
    
    curl -s -f $cpan_mirror/02packages.details.txt 2>&1 | while read line; do  

        if test $lines && test $COUNTER -gt $lines; then
          set_stdout "counter > $lines, so I am done" 
          break
        else
          run_task package-status n $COUNTER line "'$line'"
        fi

        (( ++COUNTER ))

    done

else
    while read -r line ; do

        
        if test $lines && test $COUNTER -gt $lines; then
          set_stdout "counter > $lines, so I am done" 
          exit
        else
          run_task package-status n $COUNTER line "'$line'"
        fi

        (( ++COUNTER ))

    done
fi
