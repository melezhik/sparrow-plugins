package main

import (
  "fmt"
  //"strings"
)


func main() {

  s := make([]int,10,10)

  for i := range s {
    s[i] = 1 << uint(i)
  }

  for _, v := range s {
    fmt.Println(v)
  }
}
