package main

import (
  "fmt"
)

func fib (i int) func (int) int {

  //fmt.Printf("a: %d, b: %d", a, b)

  a := 0
  b := 0
  c := 0

  return func (i int) (int) {

    switch i {
      case 0:
        c = 0
      case 1:
        c = 1
        a = 0
        b = 1
      default:
        c = a + b
        a = b // shift
        b = c // to the right
    }

    fmt.Printf(
      "fib, i=%d, a=%d, b=%d, c=%d\n",
      i, a, b, c,
    )
    return c

  }

}


func main () {

  f := fib(0)

  for i:=1; i<=9; i++ {
    f(i)
  }

}
