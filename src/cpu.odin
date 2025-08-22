package main

//CPU definition
CPU :: struct {
    memory: [4096]u8, //4kB RAM
    v: [16]u8, //v Registers V0-VF
    index:      u16, //index or address register
	stack:      [dynamic]u16, //stack Last in, first out
	delayTimer: u8,
	soundTimer: u8,
	pc:         u16, //program counter
	paused:     bool,
	speed:      int,
	opcode:     u16,
}

//CPU Constructor
create_CPU :: proc() -> CPU {
	c8: CPU
	c8.pc = 0x200 //start at 1st byte of loaded rom
	copy(c8.memory[0x50:], font)
	c8.speed = speed

	return c8
}

reset_CPU :: proc() {

}

fetch :: proc(c: ^CPU) {
	//read next two bytes at pc and combine into one u16, then increment pc by 2
	a := u16(c.memory[c.pc]) << 8
	b := u16(c.memory[c.pc + 1])
	opcode: u16 = a | b
	c.opcode = opcode
	c.pc += 2

	//fmt.printf("Opcode: 0x%X \n", opcode)
}