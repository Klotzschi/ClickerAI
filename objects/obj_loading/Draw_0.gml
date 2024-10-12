// Draw Event von obj_loading
draw_self(); // Zeichnet das rotierende Sprite

// Zeichnet einen Ladebalken
var bar_width = 200;
var bar_height = 20;
var bar_x = (room_width - bar_width) / 2;
var bar_y = room_height * 0.7;

draw_rectangle_color(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, c_gray, c_gray, c_gray, c_gray, false);
draw_rectangle_color(bar_x, bar_y, bar_x + (bar_width * (load_progress / 100)), bar_y + bar_height, c_white, c_white, c_white, c_white, false);

// Zeichnet den Ladetext
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(room_width / 2, bar_y + bar_height + 10, "Laden... " + string(round(load_progress)) + "%");