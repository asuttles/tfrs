package main

import (
	"database/sql"
	"fmt"
	_ "github.com/mattn/go-sqlite3"
)

func main() {

	// Open tfrs database
	db, err := sql.Open("sqlite3", "./database/tfrs.db")
	if err != nil {
		panic("cannot open database")
	}
	defer db.Close()

	// Query database for information
	rows, err := db.Query("SELECT * FROM supply")
	if err != nil {
		fmt.Println("Cannot query database!")
	}
	defer rows.Close()

	// Print data...
	for rows.Next() {
		var id, fy, available int
		var branch, category string

		err = rows.Scan(&id, &branch, &fy, &category, &available)
		if err != nil {
			fmt.Println("Failed to scan row!")
		}

		fmt.Printf("%5d %5s FY%2d %10s %5d\n", id, branch, fy, category, available)
	}
}
