// Im Left Pressed-Event von obj_clicker
if (instance_exists(obj_game)) {
    obj_game.clicks += obj_game.click_value * obj_game.click_power_multiplier;
    obj_game.xp += obj_game.click_value * obj_game.click_power_multiplier;
    show_debug_message("Clicked! Clicks: " + string(obj_game.clicks) + ", XP: " + string(obj_game.xp));
} else {
    show_debug_message("Error: obj_game does not exist!");
}