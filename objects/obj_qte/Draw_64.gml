draw_set_color(c_white);
draw_text(20, 20, "QTE! Follow the pattern:");
draw_text(20, 40, "Up → Right → Down → Left");

// Draw timer
var bar_width = (timer / (room_speed * 3)) * 200;
draw_rectangle(20, 60, 20 + bar_width, 70, false);