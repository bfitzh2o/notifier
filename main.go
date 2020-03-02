package main

import (
	"fmt"
	"os"
	"time"

	rpio "github.com/stianeikeland/go-rpio"
)

var pin = rpio.Pin(18)

func blink(stop chan struct{}) {
	err := rpio.Open()
	if err != nil {
		fmt.Printf("Error opening rpio: %v", err)
		os.Exit(1)
	}

	defer rpio.Close()

	pin.Output()

	for {
		select {
		case <-stop:
			pin.Low()
			return
		default:
			pin.Toggle()
			time.Sleep(time.Second)
		}
	}
}

func main() {
	stop := make(chan struct{})
	fmt.Println("Start blinking")
	go blink(stop)
	fmt.Println("Wait 10 seconds")
	time.Sleep(10 * time.Second)
	fmt.Println("Stopping")
	close(stop)
	fmt.Println("Stopped")
	time.Sleep(5 * time.Second)
	stop = make(chan struct{})
	go blink(stop)
	time.Sleep(10 * time.Second)
	close(stop)
	time.Sleep(2 * time.Second)
}
