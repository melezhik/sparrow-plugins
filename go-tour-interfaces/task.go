package main

import (
  "fmt"
)


type myFloat float64

type Vertex struct {
  X int
  Y int
}


type Abser interface {

  Abs() float64

}

func (i myFloat) Abs () float64 {
 return float64(i)
}

func (p *Vertex) Abs () float64 {

  return float64(100)
}

func main() {

  var i Abser

  fmt.Println("hello world")

  f  := myFloat(10)

  i = f

  fmt.Println(i.Abs())

  v := Vertex{}

  i = &v

}

