draw_set_font(fnt_default);
draw_set_color(c_white);

// Title and instructions
draw_text(50, 30, "QUICK TIME EVENT - CATCH THE CORRUPTED PACKET!");
draw_text(50, 50, "Repeat the arrow pattern before time runs out!");

// Draw timer bar
var timer_width = 300;
var timer_percent = timer / (room_speed * 4);
var timer_x = 50;
var timer_y = 80;

// Timer background
draw_set_color(c_gray);
draw_rectangle(timer_x, timer_y, timer_x + timer_width, timer_y + 20, true);

// Timer fill (changes color based on time)
if (timer_percent > 0.5) {
    draw_set_color(c_green);
} else if (timer_percent > 0.25) {
    draw_set_color(c_yellow);
} else {
    draw_set_color(c_red);
}
draw_rectangle(timer_x, timer_y, timer_x + timer_width * timer_percent, timer_y + 20, true);

// Timer outline and text
draw_set_color(c_white);
draw_rectangle(timer_x, timer_y, timer_x + timer_width, timer_y + 20, false);
draw_text(timer_x + timer_width + 10, timer_y, string(ceil(timer / room_speed)) + "s");

// Draw pattern sequence USING YOUR ARROW ASSETS
var pattern_start_x = 200;
var pattern_y = 150;
var arrow_spacing = 80; // Increased spacing for sprites

draw_text(pattern_start_x - 100, pattern_y - 30, "Pattern to input:");

for (var i = 0; i < array_length(pattern); i++) {
    var arrow_x = pattern_start_x + (i * arrow_spacing);
    var arrow_y = pattern_y;
    
    // Determine which arrow sprite to use
    var arrow_sprite = -1;
    if (pattern[i] == vk_up) arrow_sprite = spr_arrow_up;
    else if (pattern[i] == vk_down) arrow_sprite = spr_arrow_down;
    else if (pattern[i] == vk_left) arrow_sprite = spr_arrow_left;
    else if (pattern[i] == vk_right) arrow_sprite = spr_arrow_right;
    
    // Draw arrow background (green for completed, highlighted for current, normal for upcoming)
    if (i < index) {
        // Completed steps - green background
        draw_set_color(c_green);
        draw_rectangle(arrow_x - 25, arrow_y - 25, arrow_x + 25, arrow_y + 25, true);
        // Draw arrow sprite
        draw_sprite(arrow_sprite, 0, arrow_x, arrow_y);
    } else if (i == index) {
        // Current step - pulsating yellow background
        var pulse = abs(sin(current_time / 200)) * 0.5 + 0.5; // Pulsing effect
        draw_set_color(merge_color(c_yellow, c_white, pulse));
        draw_rectangle(arrow_x - 25, arrow_y - 25, arrow_x + 25, arrow_y + 25, true);
        // Draw arrow sprite
        draw_sprite(arrow_sprite, 0, arrow_x, arrow_y);
    } else {
        // Upcoming steps - just the arrow sprite
        draw_sprite(arrow_sprite, 0, arrow_x, arrow_y);
        // Optional: dim upcoming arrows
        draw_set_color(make_color_rgb(150, 150, 150));
        draw_rectangle(arrow_x - 25, arrow_y - 25, arrow_x + 25, arrow_y + 25, false);
    }
    
    draw_set_color(c_white);
}

// Progress indicator
draw_text(50, 200, "Progress: " + string(index) + "/" + string(pattern_length));

// Instructions
draw_text(50, 230, "Press the arrows in the exact sequence shown above!");