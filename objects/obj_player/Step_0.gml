											// Movement System | Collision System
var movex = keyboard_check(vk_right) - keyboard_check(vk_left)
var jump = keyboard_check(vk_up)
var attack = keyboard_check(vk_down)

x_speed = movex * walk_speed
y_speed += global.grav

if jump {
	if (grounded) {
		y_speed = jump_speed
		global.attacking = true
	}
}
var hcollide = instance_place(x + x_speed, y, par_wall)
if (hcollide != noone) {
	if ((hcollide).type = 1) {
		if place_meeting(x + x_speed, y, par_wall) {
			while (!place_meeting(x + sign(x_speed), y, par_wall)) x += sign(x_speed)
			x_speed = 0
		}
	}
}
x += x_speed
var vcollide = instance_place(x, y + y_speed, par_wall)
if (vcollide != noone) {
	if ((vcollide).type = 1) {
		while (!place_meeting(x, y + sign(y_speed), par_wall)) y += sign(y_speed)
		grounded = 1
		y_speed = 0
	}
	if (((vcollide).type = 2) && sign(y_speed) = 1) {
		while (!place_meeting(x, y + sign(y_speed), par_wall)) y += sign(y_speed)
		grounded = 1
		y_speed = 0
	}
}
else grounded = 0
y += y_speed

if grounded = 1 and attack = false {
	global.attacking = false
}
if grounded = 0 or attack = true {
	global.attacking = true
}

											// Coin System | Damage System
if place_meeting(x, y, obj_coin) {
	coin += 1
}
if place_meeting(x, y, obj_coin) and damaged = "yes" {
	damaged = "no"
	alarm[0] = 0
}
if place_meeting(x, y + 1, obj_spikes) and alarm[0] < 0 {
	alarm[0] = 60
	coin = 0
	if damaged = "yes" {
		damaged = "death"
	}
	if damaged = "no" {
		damaged = "yes"
	}
}
if place_meeting(x, y + 1, obj_crab) and alarm[0] < 0 and global.attacking = false {
	alarm[0] = 60
	coin = 0
	if damaged = "yes" {
		damaged = "death"
	}
	if damaged = "no" {
		damaged = "yes"
	}
}
if place_meeting(x, y, obj_void) {
	damaged = "death"
}

if (global.attacking) and (grounded) {
	walk_speed = 10
	jump_speed = 0
}
else {
	walk_speed = 5
	jump_speed = -10
}

											// Sprite System
if grounded = 1 {
	if sign(x_speed) = 0 {
		sprite_index = spr_idle
	}
	if sign(x_speed) = 1 {
		image_xscale = 1
		sprite_index = spr_run
	}
	if sign(x_speed) = -1 {
		image_xscale = -1
		sprite_index = spr_run
	}
}
if global.attacking = true {
	sprite_index = spr_ball
}

if alarm[0] > 0 {
	if image_alpha >= 1 {
		alfahit = -0.05
	}
	if image_alpha <= 0 {
		alfahit = 0.05
	}
	image_alpha += alfahit
}
else {
	image_alpha = 1
}

											// Game System
if menu = true {
	x = -20
	y = -20
	image_alpha = 0
	if keyboard_check_pressed(vk_anykey) {
		menu = false
		x = 223
		y = 580
		image_alpha = 1
	}
}
if damaged = "death" {
	damaged = true
	x = -20
	y = -20
	image_alpha = 0
	alarm[1] = 120
}
if global.sign = true {
	global.sign = false
	alarm[2] = 120
}
if alarm[2] = 1 {
	global.theend = "yes"
}
if global.theend = "yes" {
	global.theend = true
	x = -20
	y = -20
	image_alpha = 0
	alarm[1] = 180
}
if alarm[1] = 1 {
	game_restart()
}
	
show_debug_message(alarm[1])