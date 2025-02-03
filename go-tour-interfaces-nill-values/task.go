package main

import (
  "fmt"
)

type S struct {
  X string
}


func (p *S) M () {
  if p == nil {
    fmt.Printf("p is nil!")
  } else {
    fmt.Printf("[%s]",p.X)
  }
}


type I interface {

  M()

}

func main  () {


  var a *S
  var i I

  i = a

  i.M()

}
