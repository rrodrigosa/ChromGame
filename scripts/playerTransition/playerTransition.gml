//  -------------------- Room Transision collision
var inst = instance_place(x, y, obj_transition)
if (inst != noone){
	with(transitionFade){
		if(!doTransition){
			spawnRoom = inst.targetRoom
			spawnX = inst.targetX
			spawnY = inst.targetY
			doTransition = true
		}
	}
}