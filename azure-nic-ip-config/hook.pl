run_task("fetch-resource", { output => cache_root_dir()."/data.json" });
run_task("parse-resource", { list => cache_root_dir()."/data.json" });

