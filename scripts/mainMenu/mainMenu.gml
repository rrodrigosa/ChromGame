switch (mpos) {
    case 0:
        //room_goto(r_one);
        room_goto(r_teste_32_64);
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

