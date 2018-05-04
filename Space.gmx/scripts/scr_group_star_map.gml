/// Search for uninterrupted chains

// Search Variables
star_map = argument0
current_star = noone
checked_stars = ds_map_create()
q = ds_queue_create()

// Group Variables
group_map = ds_map_create()
group = ds_list_create()
ds_map_add(group_map, ds_map_size(group_map), group) 

// Starting point
ds_queue_enqueue(q, star_map[0])
ds_map_add(checked_stars, star_map[0], star_map[0].number)
ds_list_add(group, star_map[0])


while ds_map_size(checked_stars) < array_length_1d(star_map) {  // Search

    while ds_queue_size(q) > 0 {    // Dequeue and start search
        current_star = ds_queue_dequeue(q)
    
        for(i = 0; i < array_length_1d(current_star.connections); i += 1) {
            if not ds_map_exists(checked_stars, current_star.connections[i]) {
                ds_queue_enqueue(q, current_star.connections[i])                                            // Add to queue
                ds_map_add(checked_stars, current_star.connections[i], current_star.connections[i].number)  // Add to checked map
                ds_list_add(group, current_star.connections[i])                                             // Add to group list
                
            }
        }
        
    }
    
    for(i = 0; i < array_length_1d(star_map); i += 1) { // Where to start new search if not done
        if not ds_map_exists(checked_stars, star_map[i]) {
            // Start new search at unchecked star
            ds_queue_enqueue(q, star_map[i])
            ds_map_add(checked_stars, star_map[i], star_map[i].number)
            
            // New Group
            group = ds_list_create()
            ds_map_add(group_map, ds_map_size(group_map), group)
            ds_list_add(group, star_map[i])
            
            break
        }
    }
}

for(i = 0; i < ds_map_size(group_map); i += 1) {    // Print out group information to debug
    group = ds_map_find_value(group_map, i)
    for(j = 0; j < ds_list_size(group); j += 1) {
        item = ds_list_find_value(group, j)
    }
}

return group_map

