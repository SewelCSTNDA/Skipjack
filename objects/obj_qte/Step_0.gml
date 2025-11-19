if (active) {
    timer -= 1;
    if (timer <= 0) {
        // Time's up - fail
        active = false;
        with (obj_battle) event_user(2); // QTE fail
        instance_destroy();
    } else {
        // Check for arrow key presses
        if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_down) || keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right)) {
            var k = keyboard_lastkey;
            
            // Check if it matches the pattern
            if (k == pattern[index]) {
                index += 1;
                // Success if finished pattern
                if (index >= array_length(pattern)) {
                    active = false;
                    with (obj_battle) event_user(3); // QTE success
                    instance_destroy();
                }
            } else {
                // Wrong key - fail
                active = false;
                with (obj_battle) event_user(2); // QTE fail
                instance_destroy();
            }
        }
    }
}