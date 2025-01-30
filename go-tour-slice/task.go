package main

import (
  "fmt"
)


func main() {


  s1:= make([]int,5)

  fmt.Println(">>>")

  print_slice("a",s1)

  fmt.Println("<<<")
}

func print_slice(label string, s []int) {
  fmt.Printf(
    "<%s len=%d cap=%d %v>\n",
    label,
    len(s),
    cap(s),
    s,
  )
}
