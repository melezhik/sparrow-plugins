package main

import (
  "fmt"
  "time"
)



func main () {

  fmt.Println("what day is Thursday?")

  today := time.Now().Weekday()

  switch time.Saturday {
      case today + 0:
        fmt.Printf("Today")
      case today + 1:
        fmt.Printf("tommorrow")
      case today + 2:
        fmt.Printf("after tommorrow")
      default:
        fmt.Printf("way too far")
  }
}
