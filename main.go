package main

import (
    "fmt"
    "net/http"
    "os"
)

func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello, World!")
}

func main() {
    http.HandleFunc("/", handler)
    port := os.Getenv("PORT")
    if port == "" {
        port = "8080"
    }
    fmt.Printf("Listening on port %s\n", port)
    http.ListenAndServe(":"+port, nil)
}
