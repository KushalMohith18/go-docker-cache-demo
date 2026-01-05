package main

import (
	"fmt"
	"net/http"

	"github.com/KushalMohith18/go-docker-cache-demo/app/server"
)

func main() {
	server.RegisterRoutes()
	fmt.Println("Server running on :8080")
	http.ListenAndServe(":8080", nil)
}
