draw_set_font(fnt_default);
draw_set_color(c_white);

// Different titles based on cipher mode
var mode = "first";
if (variable_instance_exists(obj_battle, "cipher_mode")) {
    mode = obj_battle.cipher_mode;
}

if (mode == "first") {
    draw_text(50, 30, "DECRYPT TO DISABLE SHIELD");
    draw_text(50, 50, "=== KEY: " + string(key) + " ===");
    draw_text(50, 70, "Encrypted Shield Command: " + encrypted);
    draw_text(50, 90, "Decrypt to lower enemy shields");
} else {
    draw_text(50, 30, "UNCORRUPT THE PACKET");
    draw_text(50, 50, "=== KEY: " + string(key) + " ===");
    draw_text(50, 70, "Corrupted Packet Data: " + encrypted);
    draw_text(50, 90, "Decrypt to throw back at enemy!");
}

draw_text(50, 110, "Use ARROWS to navigate and change letters");
draw_text(50, 130, "Press ENTER to submit");

// Draw the 4 slots using your assets
var start_x = 200;
var start_y = 150;
var slot_width = 48;
var slot_height = 48;

for (var i = 0; i < letters_len; i++) {
    var center_x = start_x + (i * (slot_width + 30));
    var center_y = start_y;
    
    // Draw slot background (use active sprite if current slot)
    if (i == current_slot) {
        draw_sprite(spr_slot_active, 0, center_x, center_y);
    } else {
        draw_sprite(spr_slot, 0, center_x, center_y);
    }
    
    // Letter inside slot - CENTERED TEXT
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    if (player_input[i] != "") {
        draw_text(center_x, center_y, player_input[i]);
    } else {
        draw_set_color(c_gray);
        draw_text(center_x, center_y, "?");
        draw_set_color(c_white);
    }
    
    // Reset alignment for other text
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    // Slot number below
    draw_text(center_x - 5, center_y + slot_height/2 + 10, string(i + 1));
}

// Different text based on mode
if (mode == "first") {
    draw_text(start_x - 100, start_y - 60, "Shield Command: " + encrypted);
} else {
    draw_text(start_x - 100, start_y - 60, "Packet Data: " + encrypted);
}

draw_text(50, 250, "LEFT/RIGHT: Select slot | UP/DOWN: Change letter | ENTER: Submit");