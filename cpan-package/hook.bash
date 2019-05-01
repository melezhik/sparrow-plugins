for p in $(config list)
do
    run_task cpanm package $p
done


