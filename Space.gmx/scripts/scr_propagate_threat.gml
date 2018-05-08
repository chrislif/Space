for (i = 0; i < array_length_1d(global.star_map); i += 1) {
    star = global.star_map[i]
    star.threat_level = random_round(1, 2)
}

furthest_star = instance_furthest(manager.current_location.x, 
                                  manager.current_location.y, 
                                  obj_ui_map_star)
furthest_star.threat_level = 5

