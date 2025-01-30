package main

import (
	"fmt"
	"golang.org/x/tour/pic"
)

var f = func (dx, dy int) [][]uint8 {

	s := make([][]uint8, dx, dx)

	for i := range s {
		fmt.Printf("process row #%d\n", i)
		s[i] = make([]uint8, dy, dy)
		for j := range s[i] {
			s[i][j] = uint8((i + j) / 2)
		}
	}

	return s
}

func main() {
  pic.Show(f)
}
