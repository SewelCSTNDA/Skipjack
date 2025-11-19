// Move slot
if (keyboard_check_pressed(vk_right)) current_slot = clamp(current_slot + 1, 0, letters_len-1);
if (keyboard_check_pressed(vk_left)) current_slot  = clamp(current_slot - 1, 0, letters_len-1);

// cycle letter up/down (A..Z)
if (keyboard_check_pressed(vk_up)) {
    if (player_input[current_slot] == "") player_input[current_slot] = "A";
    else {
        var idx = ord(player_input[current_slot]) - ord("A");
        idx = (idx + 1) mod 26;
        player_input[current_slot] = chr(idx + ord("A"));
    }
}
if (keyboard_check_pressed(vk_down)) {
    if (player_input[current_slot] == "") player_input[current_slot] = "A";
    else {
        var idx = ord(player_input[current_slot]) - ord("A");
        idx = (idx - 1) mod 26;
        if (idx < 0) idx += 26;
        player_input[current_slot] = chr(idx + ord("A"));
    }
}

// allow direct letter typing (optional)
for (var k = ord("A"); k <= ord("Z"); k++) {
    if (keyboard_check_pressed(k)) {
        player_input[current_slot] = chr(k);
    }
}

// submit with ENTER
if (keyboard_check_pressed(vk_enter)) {
    var answer = "";
    for (var i=0;i<letters_len;i++) answer += string(player_input[i]);
    var expected = plaintext; // because we generated plaintext earlier
    if (answer == expected) {
        // Success
        with (obj_battle) event_user(1); // user event 1 = cipher success
        instance_destroy();
    } else {
        // fail feedback: clear slots or show shake
        show_debug_message("Cipher incorrect — expected: " + expected + " got: " + answer);
        // reset or allow retry
    }
}
