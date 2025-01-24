for config()<path><> -> $path {
  run_task "build", %(
    :$path
  )
}
