package main

import (
    "fmt"
    "github.com/stianeikeland/go-rpio/v4"
    "time"
)

func main() {
    err := rpio.Open()
    if err != nil {
        fmt.Errorf("error: %d ", err)
    }

    if err = SPIConfig(); err != nil {
        fmt.Errorf("error: %d ", err)
    }
    pin := rpio.Pin(10)

    pin.Output() // Output mode

    for i := 0; i < 10; i++ {
        pin.Toggle() // Toggle pin (Low -> High -> Low)
        rpio.SpiTransmit(0xAA)
				fmt.Println("Toggle #",i)
        time.Sleep(500 * time.Millisecond)
    }
}

func SPIConfig() error {
    err := rpio.SpiBegin(rpio.Spi1)
    if err != nil {
        fmt.Errorf("error: %d ", err)
    }

    rpio.SpiSpeed(1_000_000)
    rpio.SpiChipSelect(0)

    return nil
}