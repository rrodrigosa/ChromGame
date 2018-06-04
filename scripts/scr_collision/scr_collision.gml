//Collision horizontal with object Collision
if place_meeting(x+speed_h, y, O_Collision) {
    while !place_meeting(x+sign(speed_h), y, O_Collision) {
        x += sign(speed_h);
    }
    speed_h = 0;
}
x += speed_h;

// Collision vertical with object Collision
if place_meeting(x, y+speed_v, O_Collision) {
    while !place_meeting(x, y+sign(speed_v), O_Collision) {
        y += sign(speed_v);
    }
    speed_v = 0;
}
y += speed_v;