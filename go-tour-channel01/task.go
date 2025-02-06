package main

import (
  "fmt"
)

func sum (a []int, ch chan int ){

  s:= 0

  for _, v:= range(a) {
    s = s + v
  }

  ch <- s

}

func main () {

  a:= []int{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }

  ch:= make(chan int)
  ch2:= make(chan int)

  go sum(a[0:5], ch)

  go sum(a[5:10], ch2)

  s1:= <- ch

  s2:= <- ch2

  fmt.Println("here we go")

  fmt.Printf("s1=%d, s2=%d, sum=%d\n",s1,s2,s1+s2)

}
