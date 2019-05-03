run_task("fetch-resources", { output => cache_root_dir()."/list.json" });
run_task("parse-resources", { list => cache_root_dir()."/list.json" });

