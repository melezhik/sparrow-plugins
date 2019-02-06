rm -rf ./.tests/tmp

mkdir -p ./.tests/tmp/main
mkdir -p ./.tests/tmp/moved
mkdir -p ./.tests/tmp/copied

timestamp=$(date +%y%m%d%H%M -d "yesterday")
touch -mt $timestamp ./.tests/tmp/main/test.txt
touch -mt $timestamp ./.tests/tmp/main/test2.txt

touch ./.tests/tmp/main/file_to_move.txt

declare -a tests=$(config tests)
for test in ${tests[@]}; do
  run_story $test
done

