package main

import (
	"fmt"
	"os"
	"runtime"
)

func main() {
	fmt.Println(runtime.Version())
	fmt.Println("GOPATH:", os.Getenv("GOPATH"))
}
