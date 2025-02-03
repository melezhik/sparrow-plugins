package main

import (
  "fmt"
)


type Vertex struct {
  X int
  Y int
}

func main () {

  v := Vertex{}

  p := &v

  p.X = 10000;

  fmt.Printf("%v\n",*p)
}
