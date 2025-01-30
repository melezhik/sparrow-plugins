package main

import (
  "math"
  "fmt"
)


func compute (f func(float64,float64) float64) float64 {

  return f(3,4)

}


func  f1 ( x, y float64) float64 {

  return math.Sqrt(x*x + y*y)

}

func main () {

  fmt.Println(
    compute(math.Pow),
    "",
    compute(f1),
    "",
    f1(5,12),
  )

}
