package main

import (
  "time"
)

func main() {

  go func() { time.Sleep(10 * time.Second) }()

  ch := make ( chan int )

  ch <- 1
  ch <- 1
  ch <- 1

  <- ch
  <- ch
  <- ch

}
