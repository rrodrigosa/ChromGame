// -------------------- Movement
hinput = 0
vinput = 0
horizontal_speed = 0
vertical_speed = 0
max_hspeed = 4
// rollSpeed teste
roll_speed = 4
acceleration = 1
jump_height = -8
_gravity = 0.3
_friction = 1
// TODO - create a max gravity speed so the player doesn't go through solids (use clamp() on the vertical speed)

// manage player
is_grounded = false
player_xscale_flip = 1

// -------------------- Sword
// if the player is attacking
sword_attacking = false
// let the player attack again after the end of the animation
sword_can_attack = true
// initial attack animation, it has 3 animations. 1, 2 and 3
sword_attack_animation = 1
// timer to reset the combo
sword_combo_counter = 0
// flag is activated at the end of the first animation, so the combo counter can start
sword_combo_active = false

// -------------------- Bow
bow_attacking = false
bow_charging = false
bow_counter = 60
bow_delay = 20
// for charged shots
bow_normal_shot = true
bow_max_charge = room_speed
bow_charge_counter = 0

// -------------------- State
state = "idle"