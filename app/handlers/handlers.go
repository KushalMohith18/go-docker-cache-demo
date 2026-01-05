package handlers

import (
	"fmt"
	"net/http"

	"github.com/google/uuid"
)

var bigData [20_000_000]int

func RootHandler(w http.ResponseWriter, r *http.Request) {
	id := uuid.New()
	fmt.Fprintf(w, "Hello! Request ID: %s\n", id.String())
}
