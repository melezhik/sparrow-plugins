package main

import (
	"database/sql"
	"fmt"
	_ "github.com/mattn/go-sqlite3"
	"log"
	"os"
  "flag"
)

func main() {

  flag.Parse()

  args := flag.Args()

  db_name := args[0]
  max := args[1]

  fmt.Printf("Database: %v\n",db_name)

  fmt.Printf("Max: %v\n",max)

  if _, err := os.Stat(db_name); os.IsNotExist(err) {
		log.Fatal(err)
  }

	db, err := sql.Open("sqlite3", db_name)

	if err != nil {
		log.Fatal(err)
	}

	defer db.Close()

	q := fmt.Sprintf("select id, project, description, dt from builds order by id desc limit %v",max)

	rows, err := db.Query(q)

	if err != nil {
		log.Fatal(err)
	}

	defer rows.Close()
	i := 0;
	for rows.Next() {
		var id int
		var project string
		var desc string
		var dt string
		err = rows.Scan(&id, &project, &desc, &dt)
		if err != nil {
			log.Fatal(err)
		}
		i++;	
		fmt.Println(i, id, project, desc, dt)
	}

	err = rows.Err()

	if err != nil {
		log.Fatal(err)
	}

}
