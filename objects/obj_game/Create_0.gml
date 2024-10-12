// Create Event von obj_game

function reset_game() {
    clicks = 0;
    xp = 0;
    click_value = 1;
    upgrade_click_power = 0;
    upgrade_auto_clicker = 0;
    cost_click_power = 100;
    cost_auto_clicker = 500;
    click_power_multiplier = 1;
    auto_click_rate = 0;
    
    if (file_exists("save.txt")) {
        file_delete("save.txt");
    }
    
    show_debug_message("Spiel wurde zurückgesetzt.");
}

// Initialisierung oder Laden des Spielstands
if (file_exists("save.txt")) {
    var file = file_text_open_read("save.txt");
    var save_string = file_text_read_string(file);
    file_text_close(file);
    var save_data = json_parse(save_string);
    
    clicks = variable_struct_exists(save_data, "clicks") ? save_data.clicks : 0;
    xp = variable_struct_exists(save_data, "xp") ? save_data.xp : 0;
    click_value = variable_struct_exists(save_data, "click_value") ? save_data.click_value : 1;
    upgrade_click_power = variable_struct_exists(save_data, "upgrade_click_power") ? save_data.upgrade_click_power : 0;
    upgrade_auto_clicker = variable_struct_exists(save_data, "upgrade_auto_clicker") ? save_data.upgrade_auto_clicker : 0;
    cost_click_power = variable_struct_exists(save_data, "cost_click_power") ? save_data.cost_click_power : 100;
    cost_auto_clicker = variable_struct_exists(save_data, "cost_auto_clicker") ? save_data.cost_auto_clicker : 500;
    click_power_multiplier = variable_struct_exists(save_data, "click_power_multiplier") ? save_data.click_power_multiplier : 1;
    auto_click_rate = variable_struct_exists(save_data, "auto_click_rate") ? save_data.auto_click_rate : 0;
    
    show_debug_message("Spiel geladen.");
} else {
    reset_game();
}
// Im Create-Event von obj_game
ad_cooldown = 0;
ad_cooldown_max = 300; // 5 Minuten (300 Sekunden)
// Im Draw GUI Event von obj_game

if (room == Room1) {  // Geändert von rm_game zu Room1
    // Hauptinformationen (links)
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_text(20, 20, "Clicks: " + string(round(clicks)));
    draw_text(20, 40, "XP: " + string(round(xp)));
    draw_text(20, 60, "Click Power: x" + string(click_power_multiplier));
    draw_text(20, 80, "Auto-Clicker: " + string(auto_click_rate) + "/s");
    draw_text(20, 100, "Upgrade Click Power (Q): " + string(cost_click_power) + " XP");
    draw_text(20, 120, "Upgrade Auto-Clicker (W): " + string(cost_auto_clicker) + " XP");

    // Optionen in der oberen rechten Ecke
    draw_set_halign(fa_right);
    var right_margin = display_get_gui_width() - 20;
    var y_pos = 20;

    // Speichern und Laden
    draw_text(right_margin, y_pos, "Klick S zum Speichern");
    y_pos += 20;
    draw_text(right_margin, y_pos, "Klick L zum Laden");
    y_pos += 20;

    // Werbung
    if (ad_cooldown <= 0) {
        draw_text(right_margin, y_pos, "Klick V fuer Werbung & Power-Up");
    } else {
        draw_text(right_margin, y_pos, "Naechste Werbung in: " + string(ceil(ad_cooldown)) + "s");
    }
    y_pos += 20;

    // Neustarten
    draw_text(right_margin, y_pos, "Klick R zum Neustarten");

    // Zurücksetzen der Textausrichtung
    draw_set_halign(fa_left);
}