											// Game System
if global.level = "yes" {
	global.level = false
	sprite_index = spr_level_2
	alarm[0] = 120
}
if alarm[0] = 1 {
	sprite_index = spr_level_3
	global.sign = true
}