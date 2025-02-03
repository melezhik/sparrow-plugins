package main

import (
  "fmt"
  "math"
)



type I interface {
  M()
}


type myFloat float64

type TT struct {

  S string

}

func (p myFloat) M () {
  fmt.Println(p)
}


func (p *TT) M() {
  fmt.Println(p.S)
}



func describe (a I) {

  fmt.Printf("value: %v type: %T\n",a,a)

}


func main () {

  var i I
  i = myFloat(math.Pi)
  describe(i)
  i.M()

  i = &TT{"Hello"}
  describe(i)
  i.M()

}
