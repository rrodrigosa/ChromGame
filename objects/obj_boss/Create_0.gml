randomize()

enum boss_states {
	idle,
	wander,
	follow,
	choose_attack,
	charge_attack,
	charge_attack2,
	attack,
	attack2,
	recharge_attack, // resets the attacks cycle
	damaged,
	choose_path,
	move_to_path,
	climb_platform,
	jump_left_up,
	jump_left_down,
	jump_right_up,
	jump_right_down
}

state = boss_states.idle
counter = 0

// sets a randon direction to the initial speed
my_dir = choose(0, 180)
walk_speed = 4
horizontal_speed = lengthdir_x(walk_speed, my_dir)
vertical_speed = 0
gravity_speed = 0.3
enemy_xscale_flip = 1
is_grounded_after_attack = false

range_to_follow = 200
range_to_attack = 100

// getting hit by the player
max_health = 20
//max_health = 1 // for EndRoom test
current_health = max_health
flash = 0
hit_from = 0

// enemy shake
shake_lenght = 0
shake_magnitude = 0
shake_remain = 0

// used/set in the sword collision
// this is needed so after the shaking, the enemy goes back to a valid position (not inside solids)
before_shaking_x = 0
before_shaking_Y = 0

// minimum time before changing to the next state, so the damaged state stays longer.
min_time_change_state = room_speed

// test paths
path = 0
obj_path = 0
jump_dir = 0
jump_count = 0
can_jump = true

// test sprint attack
player_pos_once = true
can_attack = true
player_last_x = 0
sprint_speed = 8
_friction = 0.02

// test dash
len = 0