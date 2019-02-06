for p in $(config list)
do
    run_story cpanm package $p
done


