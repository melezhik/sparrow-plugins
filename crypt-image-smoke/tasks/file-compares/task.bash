perl -MCrypt::Image -e "\
Crypt::Image->new(file => '$project_root_dir/key.png', type => 'png')->encrypt\
('Hello World', '$test_root_dir/key_encrypted.png');" || exit 1

if diff $project_root_dir/key.png $test_root_dir/key_encrypted.png; then
  exit 1
else
  :
fi
