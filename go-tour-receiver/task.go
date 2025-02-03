package main


import (
    "fmt"
)



type Vertex struct {

  X int
  Y int
}


func (p Vertex) setVertex (x,y int) {

  p.X = x
  p.Y = y

}

func (p *Vertex) setVertex2 (x,y int) {

  p.X = x
  p.Y = y

}

func main() {

  v:= Vertex{10,10}
  fmt.Println(v)

  v.setVertex(5,5);
  fmt.Println(v)

  v.setVertex2(5,5);
  fmt.Println(v)

  p := &v
  p.setVertex2(3,3);
  fmt.Println(v)

  p.setVertex(2,2);
  fmt.Println(v)

}
