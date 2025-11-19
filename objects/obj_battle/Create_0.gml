state = "PATH";
cipher_key = 0;
player_hp = 10;
enemy_hp = 10;
cipher_mode = "first";

show_debug_message("BATTLE: Starting...");

// Safe spawn - check if object exists
if (object_exists(obj_path)) {
    instance_create_layer(100, 100, "Instances", obj_path);
    show_debug_message("BATTLE: obj_path spawned");
} else {
    show_debug_message("BATTLE: ERROR - obj_path doesn't exist!");
}