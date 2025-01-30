package main

import (
  //"fmt"
  "strings"
  "golang.org/x/tour/wc"
)

func count(s string) map[string]int {

  m := make(map[string]int)

  for _,i := range (strings.Fields(s)) {
    _, ok := m[i]; if ok {
      m[i]++
    } else {
      m[i] = 1
    }
  }

  // fmt.Printf("%v",catalog["BellLab"])

  return m
}


func main () {
  wc.Test(count)
}
