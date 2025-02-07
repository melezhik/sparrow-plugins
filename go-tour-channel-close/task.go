package main


import (
  "fmt"
)

func fib(max int, ch chan int) {

  a,b := 0 , 1

  for i:=0; i<max; i++ {

      ch <- a

      a, b = b, a + b

  }

  close(ch)
}

func main () {

  c := make(chan int)

  go fib(10,c)

  for i:= range(c) {
    fmt.Println(i)
  }


}
