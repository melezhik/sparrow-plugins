package main

import (
  "fmt"
  "runtime"
)

func main() {

  switch runtime.GOOS {
    case "darwin":
      fmt.Println("macos")
    case "windows":
      fmt.Println("windows!")
    default:
      fmt.Printf("unknown os: %s\n", runtime.GOOS)
  }
}
