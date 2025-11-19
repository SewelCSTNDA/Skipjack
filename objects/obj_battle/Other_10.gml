// User Event 0 - Pathfinding completed
show_debug_message("BATTLE: Path completed! Key = " + string(cipher_key));
state = "CIPHER1";
cipher_mode = "first";

// Spawn the cipher minigame
show_debug_message("BATTLE: Spawning cipher to disable shield...");
instance_create_layer(0, 0, "Instances", obj_cipher);