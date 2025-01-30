package main

import (
  "fmt"
)

type Vertex struct {
  longitude float64
  latitude float64
}


func main() {

  catalog := make(
    map[string]Vertex,
  )

  catalog["BellLab"] = Vertex{
    40.68433,
    -74.39967,
  }

  fmt.Printf("%v",catalog["BellLab"])

}
