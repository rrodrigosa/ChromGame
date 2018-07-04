switch (mpos) {
    case 0:
		room_goto(r_level_design1_Pulo)
        break;
    case 1:
        room_goto(r_options);
        break;
    case 2:
        game_end();
        break;
}

