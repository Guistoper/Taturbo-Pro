											// Game System
if menu = true {
	draw_set_font(text70)
	draw_text_transformed_color(77, 85, "TATURBO", 1, 1, 5, c_black, c_black, c_black, c_black, 0.75)
	draw_text_transformed_color(73, 80, "TATURBO", 1, 1, 5, c_orange, c_red, c_red, c_orange, 1)
	draw_set_font(text30)
	draw_text_color(173, 243, "Aperte Enter", c_black, c_black, c_black, c_black, 0.75)
	draw_text_color(170, 240, "Aperte Enter", c_yellow, c_orange, c_yellow, c_orange, 1)
}
if damaged = true {
	draw_set_font(text50)
	draw_text_color(78, 133, "Você Morreu!", c_black, c_black, c_black, c_black, 0.75)
	draw_text_color(75, 130, "Você Morreu!", c_red, c_orange, c_red, c_orange, 1)
}
if global.theend = true {
	draw_set_font(text50)
	draw_text_color(68, 133, "Você Ganhou!", c_black, c_black, c_black, c_black, 0.75)
	draw_text_color(65, 130, "Você Ganhou!", c_yellow, c_yellow, c_yellow, c_yellow, 1)
	draw_set_font(text18)
	draw_text_color(122, 207, "Muito obrigado por ter jogado!", c_black, c_black, c_black, c_black, 0.75)
	draw_text_color(120, 205, "Muito obrigado por ter jogado!", c_yellow, c_yellow, c_yellow, c_yellow, 1)
}
if not menu = true {
	draw_sprite(spr_coin, 0, 5, 13)
	draw_set_font(text18)
	draw_text_color(36, 13, coin, c_black, c_black, c_black, c_black, 0.75)
	draw_text_color(35, 12, coin, c_yellow, c_yellow, c_yellow, c_yellow, 1)
}
