package main

import (
  "fmt"
)


type Vertex struct {
  long float64
  latid float64
}

func main() {


  catalog := map[string]Vertex {
    "Bell Labs": Vertex{40.68433, -74.39967},
    "Google": Vertex{37.42202, -122.08408},
  }

  fmt.Printf("%v",catalog)

}
