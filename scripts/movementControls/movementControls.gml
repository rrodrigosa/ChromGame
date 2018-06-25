// -------------------- Gravity
vertical_speed = vertical_speed + _gravity

// blocks hinput while the player is attacking
if (!sword_attacking && !bow_attacking && state != "rolling") {
	hinput = (keyboard_check(ord("D")) || keyboard_check(vk_right) || (gamepad_axis_value(global.pad_num, gp_axislh) > 0)) - (keyboard_check(ord("A")) || keyboard_check(vk_left) || (gamepad_axis_value(global.pad_num, gp_axislh) < 0))
}
vinput = keyboard_check(ord("W")) || keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(global.pad_num, gp_face1)

// if the player attacks in the air and hits the ground, he won't slide anymore, hspeed set to 0
if (is_grounded && (sword_attacking || bow_attacking)) {
	hinput = 0
}

// -------------------- Jump
if (is_grounded && vinput != 0 && state != "rolling") {
	vertical_speed = jump_height
	is_grounded = false
}

// -------------------- Set the values to the player horizontal speed and facing direction
if hinput != 0 {
	if (hinput > 0) {
		player_xscale_flip = 1
	} else if (hinput < 0) {
		player_xscale_flip = -1
	}
	horizontal_speed += hinput * acceleration
    horizontal_speed = clamp(horizontal_speed, -max_hspeed, max_hspeed)
} else {
	if (state == "idle"){
		horizontal_speed = lerp(horizontal_speed, 0, _friction)
	}
}

// -------------------- Horizontal collision
if place_meeting(x+horizontal_speed, y, obj_solid) {
    while !place_meeting(x+sign(horizontal_speed), y, obj_solid) {
        x += sign(horizontal_speed);
    }
    horizontal_speed = 0
}
x += horizontal_speed

// -------------------- Vertical collision/gravity
if place_meeting(x, y+vertical_speed, obj_solid) {
	while !place_meeting(x, y+sign(vertical_speed), obj_solid) {
	        y += sign(vertical_speed)
	}
	// checks the last value of vertical_speed to see if the player was falling
	if vertical_speed > 0 {
		is_grounded = true
	}
	vertical_speed = 0	
} else {
	is_grounded = false
}
y += vertical_speed