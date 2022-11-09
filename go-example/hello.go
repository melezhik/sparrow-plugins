package main

import (
	"fmt"
  "os"
  "encoding/json"
  "io/ioutil"
  "log"
)

func main() {

  type Params struct {
    Foo string
  }

  type Message struct {
    Message string
  }

  type Output struct {
    State Message `json:"state"`
  }

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

  data := Output{ 
    State: Message{ 
      Message : fmt.Sprintf("you said: %s\n", c.Foo) ,
    },
  }

  // fmt.Printf("%s\n",data.state.Message)

  file, _ := json.MarshalIndent(data, "", " ")

  _ = ioutil.WriteFile(fmt.Sprintf("%s/state.json",crd), file, 0644)

  fmt.Printf("update %s/state.json\n",crd)

}
