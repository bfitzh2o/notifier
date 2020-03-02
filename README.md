# notifier [![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) [![GoDoc](https://img.shields.io/badge/go-documentation-blue.svg)](https://godoc.org/github.com/bfitzh2o/notifier/aws) [![CircleCI](https://circleci.com/gh/bfitzh2o/notifier.svg?style=shield)](https://circleci.com/gh/bfitzh2o/notifier) [![Go Report Card](https://goreportcard.com/badge/github.com/bfitzh2o/notifier)](https://goreportcard.com/report/github.com/bfitzh2o/notifier)

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
