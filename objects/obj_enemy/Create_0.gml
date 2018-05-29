randomize()

vertical_speed = 0
gravity_speed = 0.3
walk_speed = 1
my_dir = choose(-1, 1)
horizontal_speed = walk_speed * my_dir
enemy_xscale_flip = 1

health_points = 1
flash = 0
hit_from = 0

range_to_follow = 200
range_to_attack = 100

state = "enemy_walking"
enemy_attack_counter = room_speed
done = false
done_attack = false