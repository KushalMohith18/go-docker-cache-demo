package server

import (
	"net/http"

	"github.com/KushalMohith18/go-docker-cache-demo/app/handlers"
)

func RegisterRoutes() {
	http.HandleFunc("/", handlers.RootHandler)
}
