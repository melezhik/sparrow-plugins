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

  db_name := fmt.Sprintf( "%v/.sparky/projects/db.sqlite3", os.Getenv("HOME"))

  if len(args) >= 1 {
    fmt.Printf("Read database from cli args: %v\n",args[0])
    db_name = args[0]
  }

  fmt.Printf("Database: %v\n",db_name)

  if _, err := os.Stat(db_name); os.IsNotExist(err) {
		log.Fatal(err)
  }

	db, err := sql.Open("sqlite3", db_name)

	if err != nil {
		log.Fatal(err)
	}

	defer db.Close()

	rows, err := db.Query("select id, description from builds")

	if err != nil {
		log.Fatal(err)
	}

	defer rows.Close()

	for rows.Next() {
		var id int
		var desc string
		err = rows.Scan(&id, &desc)
		if err != nil {
			log.Fatal(err)
		}
		fmt.Println(id, desc)
	}

	err = rows.Err()

	if err != nil {
		log.Fatal(err)
	}

}
