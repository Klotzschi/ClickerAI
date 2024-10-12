// Im Step-Event von obj_clicker
if (obj_game.upgrade_click_power >= 5) {
    var base_speed = 3; // Erhöhte Grundgeschwindigkeit
    var speed_increase = 0.5; // Erhöhter Geschwindigkeitszuwachs pro Level
    var move_speed = base_speed + (obj_game.upgrade_click_power - 5) * speed_increase;
    
    var mouse_distance = point_distance(x, y, mouse_x, mouse_y);
    var avoidance_range = 150; // Erhöhter Ausweichbereich
    
    if (mouse_distance < avoidance_range) {
        // Berechne Richtung weg vom Mauszeiger
        var away_direction = point_direction(mouse_x, mouse_y, x, y);
        
        // Bewege in die entgegengesetzte Richtung des Mauszeigers
        var new_x = x + lengthdir_x(move_speed * 1.5, away_direction); // Schnellere Flucht
        var new_y = y + lengthdir_y(move_speed * 1.5, away_direction);
        
        // Stelle sicher, dass obj_clicker im Raum bleibt
        new_x = clamp(new_x, 0, room_width);
        new_y = clamp(new_y, 0, room_height);
        
        x = lerp(x, new_x, 0.2); // Schnellere Annäherung an die Zielposition
        y = lerp(y, new_y, 0.2);
    } else {
        // Zufällige Bewegung, wenn der Mauszeiger weit genug entfernt ist
        if (!moving) {
            moving = true;
            move_direction = random(360);
        }
        
        var new_x = x + lengthdir_x(move_speed, move_direction);
        var new_y = y + lengthdir_y(move_speed, move_direction);
        
        // Prüfe, ob die neue Position innerhalb der Raumgrenzen liegt
        if (new_x < 0 || new_x > room_width || new_y < 0 || new_y > room_height) {
            // Ändere die Richtung
            move_direction = random(360);
        } else {
            // Bewege das Objekt zur neuen Position
            x = lerp(x, new_x, 0.2);
            y = lerp(y, new_y, 0.2);
        }
    }
} else {
    moving = false;
}