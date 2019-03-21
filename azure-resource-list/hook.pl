run_story("fetch-resources", { output => cache_root_dir()."/list.json" });
run_story("parse-resources", { list => cache_root_dir()."/list.json" });

