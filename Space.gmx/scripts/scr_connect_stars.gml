//Variables
star_map = argument0
check_distance = 125

//Border Locations: 
map_height = 668
map_width = 924

//Area Connections
for (i = 0; i < array_length_1d(star_map); i += 1) {
    current_star = star_map[i]
    
    for(j = i + 1; j < array_length_1d(star_map); j += 1) {
        check_star = star_map[j]
        star_distance = point_distance(current_star.x, current_star.y, check_star.x, check_star.y)
        
        if star_distance <= check_distance {
            current_star.connections = array_insert(current_star.connections, check_star)
            check_star.connections   = array_insert(check_star.connections, current_star)
        }
    }
}

//Add Connections to those without
for (i = 0; i < array_length_1d(star_map); i += 1) {
    current_star = star_map[i]
    closest_star = noone
    
    if current_star.connections = noone {
        distance = 99999999
    
        for (j = 0; j < array_length_1d(star_map); j += 1) {
            check_star = star_map[j]
            star_distance = point_distance(current_star.x, current_star.y, check_star.x, check_star.y)
            
            if star_distance < distance and star_distance != 0{
                distance = star_distance
                second_star = closest_star
                closest_star = check_star
            }
        }
    } 
    
    //Add Closest and Second Closest Star
    if closest_star != noone {
        current_star.connections = array_insert(current_star.connections, closest_star)
        closest_star.connections = array_insert(closest_star.connections, current_star)
    }
}

group_map = scr_group_star_map(star_map)
group_coordinates = ds_map_create()
group_count = ds_map_size(group_map)

while group_count > 1 {
    for (i = 0; i < ds_map_size(group_map); i += 1) {    // Find Center point of groups
        group = ds_map_find_value(group_map, i)
        gx = 0
        gy = 0
     
        for(j = 0; j < ds_list_size(group); j += 1) {
            item = ds_list_find_value(group, j)
            gx += item.x
            gy += item.y
        }
        gx = gx / ds_list_size(group) 
        gy = gy / ds_list_size(group)
        
        ds_map_add(group_coordinates, "g" + string(group) + "x", gx)
        ds_map_add(group_coordinates, "g" + string(group) + "y", gy)
    }
    
    for (i = 0; i < ds_map_size(group_map); i += 1) {    // Find Center point of groups
        group = ds_map_find_value(group_map, i)
        gx = ds_map_find_value(group_coordinates, "g" + string(group) + "x")
        gy = ds_map_find_value(group_coordinates, "g" + string(group) + "y")
        
        group_distance = 99999
        gfx = 0
        gfy = 0
        closest_group = noone
     
        for(j = 0; j < ds_map_size(group_map); j += 1) {
            group2 = ds_map_find_value(group_map, j)
            g2x = ds_map_find_value(group_coordinates, "g" + string(group2) + "x")
            g2y = ds_map_find_value(group_coordinates, "g" + string(group2) + "y")
            distance = point_distance(gx, gy, g2x, g2y)
            
            if distance < group_distance and distance != 0{
                group_distance = distance
                closest_group = group2
                gfx = g2x
                gfy = g2y
            }
        }
        
        scr_connect_group(group, closest_group)
    }
    
    group_map = scr_group_star_map(star_map)
    group_coordinates = ds_map_create()
    group_count = ds_map_size(group_map)
    print("NUMBER OF GROUPS: " + string(ds_map_size(group_map)))
}

