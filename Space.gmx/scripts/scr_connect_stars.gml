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
                closest_star = check_star
            }
        }
    } 
    
    //Add Closest Star
    if closest_star != noone {
        current_star.connections = array_insert(current_star.connections, closest_star)
        closest_star.connections = array_insert(closest_star.connections, current_star)
    } 
}
