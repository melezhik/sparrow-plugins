git checkout -- .
find -path '.*md' -exec perl -i -p -e 's{sparrow\s+plg\s+run\s+(\S+)\s+--param\s+}{s6 --plg-run $1@}g' {} \;
find -path '.*md' -exec perl -i -p -e 's{\s*--param\s+(\S+)}{,$1}g' {} \;
find -path '.*md' -exec perl -i -p -e 's{sparrow\s+plg\s+run\s+(\S+)\s*\\}{s6 --plg-run $1@\\}g' {} \;
find -path '.*md' -exec perl -i -p -e 's{^,}{    ,}g' {} \;
find -path '.*md' -exec perl -i -p -e 's{\s+\\$}{\\}g' {} \;
find -path '.*md' -exec perl -i -p -e 's{sparrow\s+plg\s+run}{s6 --plg-run}g' {} \;
find -path '.*md' -exec perl -i -p -e 's{.*sparrow\s+project\s+create.*$}{}mg' {} \;
find -path '.*md' -exec perl -i -p -e 's{.*sparrow\s+task\s+add.*$}{}mg' {} \;
find -path '.*md' -exec perl -i -p -e 's{sparrow\s+task\s+ini}{s6 --task-set}g' {} \;
find -path '.*md' -exec perl -i -p -e 's{sparrow\s+task\s+run}{s6 --task-run}g' {} \;

