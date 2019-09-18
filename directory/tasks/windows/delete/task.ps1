$path = config path

If((test-path $path)) {
    Remove-Item -LiteralPath $path -Force -Recurse
}
