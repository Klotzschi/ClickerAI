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