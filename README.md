# notifier
Blinky light(s) to get your attention when you have a pending notification while you are head down coding

## Hardware

- Raspberry Pi (I'm using a [Raspberry Pi Zero W](https://www.adafruit.com/product/3400))
- LED (I'm using a [diffused blue 10mm LED](https://www.adafruit.com/product/847))
- Resistor (I'm using a 550 ohm resistor)
- Breadboard or protoboard

## Blinking the light

Uses [go-rpio](github.com/stianeikeland/go-rpio) to access GPIO on the Raspberry Pi.

I wrote a `blink()` function to blink the LED as explained in this [Blinking LED on Raspberry Pi using Golang](https://www.admfactory.com/blinking-led-on-raspberry-pi-using-golang/) tutorial.

I'm trying to use a channel with an empty struct to signal the `blink()` function
when to stop as explained in [Starting and stopping things with a signal channel](https://medium.com/@matryer/golang-advent-calendar-day-two-starting-and-stopping-things-with-a-signal-channel-f5048161018)
blog post.

## Github

Looking at using the [Go Github Webhook](https://groob.io/tutorial/go-github-webhook/)

## Gmail

Looking at using [Pub/Sub webhooks](https://cloud.google.com/pubsub/docs/overview)
