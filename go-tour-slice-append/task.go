package main

import (
  "fmt"
)


func main() {

  s := []int{};
  print_slice(s);

  s = append(s,0)
  print_slice(s);

  s = append(s,1)
  print_slice(s);

  s = append(s,2,3,4);

  print_slice(s);

  // will through panic: runtime error: index out of range [5] with length 5
  fmt.Println(s[5]) 

}

func print_slice(s []int) {
  fmt.Printf(
    "<len=%d cap=%d %v>\n",
    len(s),
    cap(s),
    s,
  )
}
