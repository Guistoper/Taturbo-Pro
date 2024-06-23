											// Movement System
if x_speed = true {
	x += walk_speed
}
if x_speed = false {
	x -= walk_speed
}
if place_meeting(x, y, obj_ewall) {
	if x_speed = true {
		x_speed = false
	}
	else if x_speed = false {
		x_speed = true
	}
}
if not place_meeting(x, y, par_wall) {
	y_speed += global.grav
} 
else {
	y_speed = 0
}
y += y_speed

											// Damage System
if global.attacking = true and place_meeting(x, y, obj_player) {
	instance_destroy()
}

											// Sprite System
if x_speed = true {
	image_xscale = 1
}
if x_speed = false {
	image_xscale = -1
}