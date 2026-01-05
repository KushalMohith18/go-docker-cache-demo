package server

import (
	"net/http"

	"github.com/yourname/go-docker-cache-demo/app/handlers"
)

func RegisterRoutes() {
	http.HandleFunc("/", handlers.RootHandler)
}
