/// @desc slideTransition(mode, targetroom)
/// @arg Transiton Mode
/// @arg Target Target room for goto mode

with (transitionEnum) {
	mode = argument[0]
	if (argument_count > 1) {
		target = argument[1]
	}
}