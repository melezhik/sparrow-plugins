package main

import (
  "fmt"
)

func main () {

  fmt.Println("hello from main")

  i := 0

  i++

  defer fmt.Printf("by from main 1, i=%d\n",i)
  defer fmt.Println("by from main 2")
  defer func() {
    fmt.Printf("by from main 3, i=%d\n",i )
  }()
}

