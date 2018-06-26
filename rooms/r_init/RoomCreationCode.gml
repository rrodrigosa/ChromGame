// -------------------- Game Analytics
// Short messages will be output when enabled explaining when some action is being performed by the SDK
//ga_setEnabledInfoLog(true);
// Console output when each event is added (all fields) in JSON string format. This is the data being submitted 
// to the GA servers for each event.
//ga_setEnabledVerboseLog(true);

//// Configure build version
//ga_configureBuild("alpha 1.0.0");

//// Initialize
//ga_initialize("dccba089089cc8f7539462170e435c08", "bde54144bcb6493a7888cb4bbbdd0c181741749d");

// -------------------- Global Variables
#region // old code for nearest checkpoint
//// initialise the variables for the closest checkpoint the player is
//// and last distance
//global.closest_checkpoint = noone
//global.checkpoint_distance = 0
//global.max_checkpoint_distance = 999999
#endregion
global.pad_num = 0
global.last_activated_checkpoint = noone
global.can_move = true

// -------------------- Go to next room
//window_set_fullscreen(true)
room_goto_next()