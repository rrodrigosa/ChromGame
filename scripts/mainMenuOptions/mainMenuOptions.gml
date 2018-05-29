switch (mpos) {
    case 0:
        if mpos == 0 {
            music = !music;
            if music == false {
                //audio_stop_sound(sound5);
            } else {
                //audio_play_sound(sound5, 0, true);
            }
        }
        break;
    
    case 1:
        room_goto_previous();
        break;
}