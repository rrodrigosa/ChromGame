switch (mpos) {
    case 0:
		//room_goto(r_tuto_controls)
		room_goto(r_tuto_ANA)
        break;
    case 1:
        room_goto(r_options);
        break;
    case 2:
        //room_goto(r_credits);
        break;
    case 3:
        game_end();
        break;
}

