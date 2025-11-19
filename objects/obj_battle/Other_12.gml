// User Event 2 - QTE Failed (missed the packet)
show_debug_message("BATTLE: QTE FAILED - Player hit by corrupted packet!");
player_hp -= 2;
show_debug_message("BATTLE: Player HP: " + string(player_hp));

if (player_hp <= 0) {
    show_debug_message("BATTLE: GAME OVER - Player defeated!");
} else {
    // Shield is still down, so enemy attacks again
    state = "ATTACK";
    show_debug_message("BATTLE: Enemy attacking again with another packet!");
    alarm[0] = room_speed * 1;
}