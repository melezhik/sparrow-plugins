perl -MCrypt::Image -e "\
my \$crypter = Crypt::Image->new(file => '$project_root_dir/key.png', type => 'png'); \
\$crypter->encrypt('Hello World', '$test_root_dir/key_encrypted.png'); \
print \$crypter->decrypt('$test_root_dir/key_encrypted.png');
"

