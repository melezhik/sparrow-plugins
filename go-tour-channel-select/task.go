package main

import (
  "fmt"
)


func fib (c chan int, q chan bool) {

  x,y := 0, 1

  for {
    select {
    case <-q:
      return
    case c <- x:
      x, y = y, x + y
    default:
    }
  }
}

func main () {

  q := make(chan bool)
  c := make(chan int)
  go fib(c,q)
  for i:=0; i<=10; i++ {
    v := <- c
    fmt.Println(v)
  }
  q <- true
}
