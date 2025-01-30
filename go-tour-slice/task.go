package main

import (
  "fmt"
)


func main() {


  s1:= make([]int,5)

  fmt.Println(">>>")

  print_slice("a",s1)

  s2:= make([]int,0,5)

  // alternative:
  // s2 := s1[:0]

  print_slice("b",s2)

  s3 := make([]int,2,5)

  print_slice("c",s3)

  s4 := s1[2:5]

  print_slice("d",s4)

  fmt.Println("<<<")
}

func print_slice(label string, s []int) {
  fmt.Printf(
    "<%s len=%d cap=%d %v> type=%T\n",
    label,
    len(s),
    cap(s),
    s,
    s,
  )
}
