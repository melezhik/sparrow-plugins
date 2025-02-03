package main

import (
  "fmt"
)

func main () {

  i := 1
  j := 2

  p := &i

  fmt.Println(*p)

  *p = 10

  fmt.Println(*p)
  fmt.Println(i)

  fmt.Println(j)

  p = &j

  *p = *p * 2

  fmt.Println(j)
  fmt.Println(*p)


}

