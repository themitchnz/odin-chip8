package main

import "core:fmt"
import "core:strings"
import "core:os"
import rl "vendor:raylib"

//display constants
W_COLS :: 64 //width
H_ROWS :: 32 //height
SCALE :: 20

//audio constants
SAMPLE_RATE :: 48000
BASE_FREQ :: 220

//color
pixel_colour := rl.GREEN
bg_colour := rl.BLACK

//SPEED
speed := 660

main :: proc() {
    fmt.printf("Hello world")
}