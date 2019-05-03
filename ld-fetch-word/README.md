# ld-fetch-word

Fetch phrases from longman


# INSTALL

  s6 --install ld-fetch-word

# USAGE

    # grasp phrases for word "set in", store the content into /tmp/out.txt file
    # sleep 2 seconds, before making request
  
    $ sparrow plg run ld-fetch-word --param word=set-in --param out=/tmp/out.txt --param sleep=2

# Parameters

## word

Word to fetch.

## out

Where to write fetched phrases, default vaule is `/dev/null`

## sleep

Sleep `sleep` second before making http request.

## cache

Path to cache directory. If cache exists the plugin quits quirky doing nothing.

    --param cache=/tmp/cache-dir/

# Author

Alexey Melezhik

