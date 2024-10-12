// Async - Audio Loading Event von obj_loading
if (async_load[? "id"] == load_request_id) {
    if (async_load[? "status"]) {
        load_progress = 100;
        show_debug_message("Audio group loaded successfully");
    } else {
        show_debug_message("Failed to load audio group");
    }
}