// Step Event von obj_game

// Auto-Clicker Logik
clicks += auto_click_rate * click_power_multiplier / room_speed;
xp += auto_click_rate * click_power_multiplier / room_speed;

// Upgrade-Logik
if (keyboard_check_pressed(ord("Q")) && xp >= cost_click_power) {
    xp -= cost_click_power;
    upgrade_click_power++;
    click_power_multiplier = 1 + (upgrade_click_power * 0.5);
    cost_click_power = round(cost_click_power * 1.5);
    
    // Aktualisiere die Bewegungsgeschwindigkeit von obj_clicker
    if (instance_exists(obj_clicker)) {
        obj_clicker.move_speed = max(0, 1 + (upgrade_click_power - 5) / 5);
    }
}

if (keyboard_check_pressed(ord("W")) && xp >= cost_auto_clicker) {
    xp -= cost_auto_clicker;
    upgrade_auto_clicker++;
    auto_click_rate = upgrade_auto_clicker;
    cost_auto_clicker = round(cost_auto_clicker * 2);
}

// Speichern
if (keyboard_check_pressed(ord("S"))) {
    var save_data = {
        clicks: clicks,
        xp: xp,
        click_value: click_value,
        upgrade_click_power: upgrade_click_power,
        upgrade_auto_clicker: upgrade_auto_clicker,
        cost_click_power: cost_click_power,
        cost_auto_clicker: cost_auto_clicker,
        click_power_multiplier: click_power_multiplier,
        auto_click_rate: auto_click_rate
    };
    var save_string = json_stringify(save_data);
    var file = file_text_open_write("save.txt");
    file_text_write_string(file, save_string);
    file_text_close(file);
    show_debug_message("Spiel gespeichert.");
}

// Neustarten des Spiels
if (keyboard_check_pressed(ord("R"))) {
    var restart = show_question("Möchten Sie das Spiel wirklich neu starten? Aller Fortschritt geht verloren.");
    if (restart) {
        reset_game();
    }
}
// Im Step-Event von obj_game

// Aktualisiere den Cooldown für Werbeanzeigen
if (ad_cooldown > 0) {
    ad_cooldown -= 1/room_speed;
}

// Überprüfe, ob der Spieler auf den "Werbung ansehen" Button klickt
if (keyboard_check_pressed(ord("V")) && ad_cooldown <= 0) {
    var watch_ad = show_question("Möchten Sie eine Werbung ansehen, um einen Power-Up zu erhalten?");
    if (watch_ad) {
        // Hier würde normalerweise der Code zum Anzeigen der Werbung stehen
        // Für dieses Beispiel simulieren wir einfach eine 5-sekündige Wartezeit
        show_message("Werbung wird abgespielt...");
        
        // Warte 5 Sekunden (in einem echten Spiel würde dies asynchron geschehen)
        var start_time = current_time;
        while (current_time - start_time < 5000) {
            // Warte
        }
        
        // Belohnung geben
        var reward_type = irandom(2); // 0, 1, oder 2
        switch(reward_type) {
            case 0:
                // Temporärer Click Power Boost
                click_power_multiplier *= 2;
                alarm[0] = 30 * room_speed; // Setzt einen Alarm für 30 Sekunden
                show_message("Du hast einen 2x Click Power Boost für 30 Sekunden erhalten!");
                break;
            case 1:
                // Sofortige Clicks
                var bonus_clicks = 1000 * click_power_multiplier;
                clicks += bonus_clicks;
                xp += bonus_clicks;
                show_message("Du hast " + string(bonus_clicks) + " sofortige Clicks erhalten!");
                break;
            case 2:
                // Temporärer Auto-Clicker Boost
                auto_click_rate *= 2;
                alarm[1] = 60 * room_speed; // Setzt einen Alarm für 60 Sekunden
                show_message("Du hast einen 2x Auto-Clicker Boost für 60 Sekunden erhalten!");
                break;
        }
        
        // Setze den Cooldown
        ad_cooldown = ad_cooldown_max;
    }
}