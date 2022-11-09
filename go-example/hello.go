package main

import (
	"fmt"
  "os"
  "encoding/json"
  "io/ioutil"
  "log"
)

type Params struct {
  Foo string
}

func main() {

  crd := os.Getenv("cache_root_dir")

  fmt.Printf("CACHE_ROOT_DIR: %s\n",crd)

  var c Params

  jsonFile, err := os.Open(fmt.Sprintf("%s/config.json",crd))
  if err != nil {
    log.Fatal(err)
  }

  defer jsonFile.Close()

  byteValue, _ := ioutil.ReadAll(jsonFile)

  fmt.Printf("json: %s\n",byteValue)

  json.Unmarshal(byteValue, &c)

  fmt.Printf("You passed foo: %s\n", c.Foo)

}
