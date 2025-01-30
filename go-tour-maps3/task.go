package main

import (
  "fmt"
)


func main() {


  comp := map[string]string{
    "APPL": "Apple",
    "GOGL": "Google",
    "MT"  : "Meta",
  }

  v, ok := comp["Foo"]

  fmt.Println(ok)

  if ok == true {
    fmt.Println(v)
  }

  v, ok = comp["APPL"]

  fmt.Println(ok)

  if ok == true {
    fmt.Println(v)
  }

  delete(comp,"APPL")

  v, ok = comp["APPL"]

  fmt.Println(ok)

  if ok == true {
    fmt.Println(v)
  }
}
