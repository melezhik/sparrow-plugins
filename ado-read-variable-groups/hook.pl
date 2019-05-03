
run_task("fetch-group",{ output => cache_root_dir()."/data.json" });
run_task("parse-data",{ output => cache_root_dir()."/data.json" });
