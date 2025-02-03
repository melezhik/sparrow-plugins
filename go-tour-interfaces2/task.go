package main

import (
  "fmt"
)


type My struct {

  S string

}

func (i My) Say () {
  fmt.Println(i.S)
}

type Sayish interface {

  Say ()

}

func main () {

  var s Sayish

  s = My{"Hello"}

  s.Say()

}
