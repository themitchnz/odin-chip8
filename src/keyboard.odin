package main 

import rl "vendor:raylib"

key_pressed :[16] bool
last_key_index := 0x0

get_key_state :: proc () {
    //1234 -> 123C
    key_pressed[0x1] = rl.IsKeyDown(rl.KeyboardKey.ONE)
    key_pressed[0x2] = rl.IsKeyDown(rl.KeyboardKey.TWO) 
    key_pressed[0x3] = rl.IsKeyDown(rl.KeyboardKey.THREE)
    key_pressed[0xC] = rl.IsKeyDown(rl.KeyboardKey.FOUR) 

    //QWER -> 456D
    key_pressed[0x4] = rl.IsKeyDown(rl.KeyboardKey.Q)
    key_pressed[0x5] = rl.IsKeyDown(rl.KeyboardKey.W) 
    key_pressed[0x6] = rl.IsKeyDown(rl.KeyboardKey.E) 
    key_pressed[0xD] = rl.IsKeyDown(rl.KeyboardKey.R) 

    //ASDF -> 789E
    key_pressed[0x7] = rl.IsKeyDown(rl.KeyboardKey.A) 
    key_pressed[0x8] = rl.IsKeyDown(rl.KeyboardKey.S)
    key_pressed[0x9] = rl.IsKeyDown(rl.KeyboardKey.D) 
    key_pressed[0xE] = rl.IsKeyDown(rl.KeyboardKey.F) 

    //ZXCV -> A0BF
    key_pressed[0xA] = rl.IsKeyDown(rl.KeyboardKey.Z) 
    key_pressed[0x0] = rl.IsKeyDown(rl.KeyboardKey.X) 
    key_pressed[0xB] = rl.IsKeyDown(rl.KeyboardKey.C) 
    key_pressed[0xF] = rl.IsKeyDown(rl.KeyboardKey.V) 
}

wait_for_key_press :: proc () -> bool {

    for pressed, i in key_pressed {
        if (pressed) {
            last_key_index = i
            return pressed
        }
    }

    return false
}