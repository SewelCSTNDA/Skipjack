show_debug_message("QTE FAILED - Player takes damage!");
player_hp -= 2;
if (player_hp <= 0) {
    show_debug_message("GAME OVER");
} else {
    // Go back to start
    state = "PATH";
    show_debug_message("Back to pathfinding...");
}