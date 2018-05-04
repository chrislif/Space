switch argument0 {
    case "open_map":
        map_ui = instance_create(room_width/2, room_height/2, obj_ui_map)
        map_ui.manager = self.manager
        map_ui.show_star_map = true
        break
    case "jump_to":
        manager.warp_btn.show = false
        manager.map_btn.show = false
        
        manager.current_location = manager.selected_star
        manager.selected_star.selected = false
        manager.selected_star = noone
        
        scr_load_star_arena(manager.current_location)
        break
}

