/// @desc Timer to spawn the sword obj so it mathes the animation
with (instance_create_layer(x, y, "Player", obj_sword)) {
        image_xscale = other.player_xscale_flip
}