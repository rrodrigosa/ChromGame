/// @description Insert description here
// You can write your code in this editor
var move = 0;
timer++;
var sobe = 0;
var desce = 0;

//if timer > 5 {
//    if gamepad_axis_value(4, gp_axislv) > 0 {
//        desce = 1;
//    } else if gamepad_axis_value(4, gp_axislv) < 0 {
//        sobe = 1;
//    }
//    timer = 0;
//}


move -= max(keyboard_check_pressed(vk_up), keyboard_check_pressed(ord("W")), gamepad_button_check_pressed(0, gp_padu), gamepad_button_check_pressed(4, gp_padu), sobe, 0);
move += max(keyboard_check_pressed(vk_down), keyboard_check_pressed(ord("S")), gamepad_button_check_pressed(0, gp_padd), gamepad_button_check_pressed(4, gp_padd), desce, 0);

if move != 0 {
    mpos += move;
    if mpos < 0 {
        mpos = array_length_1d(menu) - 1;
    }
    if mpos > array_length_1d(menu) - 1 {
        mpos = 0;
    }
	timer_bool = true;
}

var push = 0;
push = max(keyboard_check_released(vk_enter), keyboard_check_released(vk_shift), keyboard_check_released(vk_space), gamepad_button_check_released(0, gp_face3), gamepad_button_check_released(4, gp_face3), 0);

if push == 1 {
    mainMenu()
}


