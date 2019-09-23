if os() eq 'windows' {
    run_task "windows"
} else {
    run_task "linux"
}