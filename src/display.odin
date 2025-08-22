package main

import "core:fmt"
import "core:math"
import "core:math/linalg"
import rl "vendor:raylib"

Display :: struct {
    rows: int, //64
    cols: int, //32
    framebuffer: [W_COLS * H_ROWS] bool //2048
}

set_pixel_display :: proc (d: ^Display, x: int, y: int) -> bool {
    x := x //shadow copies
	y := y //shadow copies

    if x > d.cols {
		x -= d.cols
	} else if x < 0 {
		x += d.cols
	}

	if y > d.rows {
		y -= d.rows
	} else if x < 0 {
		y += d.rows
	}

	pixel_location := x + (y * d.cols)
	d.framebuffer[pixel_location] ~= true

	return !(d.framebuffer[pixel_location])
}

clear_display :: proc(d: ^Display) {
    d.framebuffer = {}
    rl.ClearBackground(bg_colour)
}

render_display :: proc (d: ^Display) {
    rl.ClearBackground(bg_colour)

    //loop through screen buffer and display pixel if set (true)
    for pixel,i in d.framebuffer {

		if (pixel) {
			x := i32(i % W_COLS) //sprite should wrap around
			y := i32(i / W_COLS) //sprite should wrap around
			rl.DrawRectangle(i32(x * SCALE), i32(y * SCALE), SCALE, SCALE, pixel_colour)
		}
	}
}



