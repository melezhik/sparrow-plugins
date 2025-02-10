package main

import (
  "time"
  "fmt"
)


func main () {

  t := time.Tick(1000*time.Millisecond)
  boom := time.Tick(5*time.Second)


  for {
    select {

      case <- t:
        fmt.Println("tick ...")
      case <- boom:
        fmt.Println("boom! ...")
        return
      default:
        fmt.Println("sleep for awhile")
        time.Sleep(500*time.Millisecond)
    }

  }
}
