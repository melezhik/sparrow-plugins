package main

import (
  "fmt"
  //"strings"
)


func main() {

  s := [][]string{
    []string{"_","_","_"},
    []string{"_","_","_"},
    []string{"_","_","_"},
  }

  s[0][0] = "X";
  s[2][2] = "O";
  s[0][2] = "X";
  s[1][0] = "O";
  s[1][2] = "X";

  print_matrix(s);

}

func print_matrix(s [][]string) {
  for _, r := range s {
    for _, c:= range r {
      fmt.Printf("%s ", c)
    }
    fmt.Println("")
  }
}
