randomize()

enum states {
	idle,
	wander,
	follow,
	charge_attack,
	attack,
	recharge_attack,
	damaged
}
state = states.idle
counter = 0
// sets a randon direction to the initial speed
my_dir = choose(0, 180)
walk_speed = 2
horizontal_speed = lengthdir_x(walk_speed, my_dir)
vertical_speed = 0
gravity_speed = 0.3
enemy_xscale_flip = 1
is_grounded_after_attack = false

range_to_follow = 200
range_to_attack = 100

// getting hit by the player
health_points = 3
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