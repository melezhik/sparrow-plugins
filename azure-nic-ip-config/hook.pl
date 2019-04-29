run_story("fetch-resource", { output => cache_root_dir()."/data.json" });
run_story("parse-resource", { list => cache_root_dir()."/data.json" });

