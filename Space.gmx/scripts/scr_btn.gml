switch argument0 {
    case "open_map":
        map_ui = instance_create(room_width/2, room_height/2, obj_ui_map)
        map_ui.manager = self.manager
        map_ui.show_star_map = true
        break
    case "jump_to":
        if show = true {
            manager.warp_btn.show = false
            manager.map_btn.show = false
            manager.ship_btn.show = false
            
            if manager.current_location == noone and manager.threat_propagated = false{
                manager.current_location = manager.selected_star
                scr_propagate_threat()
                manager.threat_propagated = true
            } 
            else {
                manager.current_location = manager.selected_star
            }
            
            manager.selected_star.selected = false
            manager.selected_star = noone
            
            manager.player.x = 1024
            manager.player.y = 1400
            manager.player.reload_time = manager.player.reload
            
            scr_load_star_arena(manager.current_location)
        }
        break
    case "open_ship":
        ship_ui = instance_create(room_width/2, room_height/2, obj_ui_ship)
        ship_ui.manager = self.manager
        break
}

