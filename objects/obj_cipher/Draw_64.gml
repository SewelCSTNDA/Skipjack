draw_set_font(font);
draw_text(20,20, "Cipher Minigame — Key: " + string(key));
draw_text(20,50, "Encrypted: " + encrypted);
draw_text(20,80, "Fill 4 slots with the plaintext (use arrow keys or type). Press ENTER to submit.");

// draw 4 slots
var base_x = 120; var base_y = 150;
for (var i=0;i<letters_len;i++) {
    var bx = base_x + i*64;
    draw_rectangle(bx, base_y, bx+48, base_y+48, false);
    if (i == current_slot) {
        draw_rectangle(bx-2, base_y-2, bx+50, base_y+50, false);
    }
    if (player_input[i] != "") draw_text(bx+14, base_y+12, player_input[i]);
}
