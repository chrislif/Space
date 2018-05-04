g1 = argument0
g2 = argument1

final_distance = 999999
final_star_g1 = noone
final_star_g2 = noone

for (h = 0; h < ds_list_size(g1); h += 1) {
    current_star = ds_list_find_value(g1, h)
    closest_distance = 999999
    closest_star = noone
    
    for (k = 0; k < ds_list_size(g2); k +=1) {
        check_star = ds_list_find_value(g2, k)
        distance = point_distance(current_star.x, current_star.y, check_star.x, check_star.y)
        
        if distance < closest_distance {
            closest_distance = distance
            closest_star = check_star
        }
    }
    
    if closest_distance < final_distance {
        final_distance = closest_distance
        final_star_g1 = current_star
        final_star_g2 = closest_star
    }
}

final_star_g1.connections = array_insert(final_star_g1.connections, final_star_g2)
final_star_g2.connections = array_insert(final_star_g2.connections, final_star_g1)

