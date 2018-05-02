star_map = argument0
check_distance = round(sqrt(sqr(128) + sqr(128))) + 1

//Border Locations: 
map_height = 668
map_width = 924
low_y_border  = room_height/2 - map_height/2 
high_y_border = room_height/2 + map_height/2
low_x_border  = room_width /2 - map_width /2
high_x_border = room_width /2 + map_width /2

//Initial Check
for (i = 0; i < array_length_1d(star_map); i += 1) {
    current_star = star_map[i]
    
    low_x_check  = false
    high_x_check = false
    low_y_check  = false
    high_y_check = false

    //Border Checks
    if current_star.x < low_x_border  + check_distance {
        low_x_check = true
    }
    if current_star.x > high_x_border - check_distance {
        high_x_check = true
    }
    if current_star.y < low_y_border  + check_distance {
        low_y_check = true
    }
    if current_star.y > high_y_border - check_distance {
        high_y_check = true
    }   
    
    for(j = i + 1; j < array_length_1d(star_map); j += 1) {
        check_star = star_map[j]
        add_star = false
        border_case = false
        
        star_distance = point_distance(current_star.x, current_star.y, check_star.x, check_star.y)
        if star_distance <= check_distance {
            add_star = true
        }
        
        if low_x_check {
            star_distance = point_distance(high_x_border, current_star.y, check_star.x, check_star.y)
            point = instance_create(high_x_border, current_star.y, obj_point)
            point.number = current_star.number
            if star_distance <= check_distance {
                border_case = true
                print("CONNECT " + string(i) + " TO " + string(j))
            }
        }
        
        if high_x_check {
            star_distance = point_distance(low_x_border, current_star.y, check_star.x, check_star.y)
            point = instance_create(low_x_border, current_star.y, obj_point)
            point.number = current_star.number
            if star_distance <= check_distance {
                border_case = true
                print("CONNECT " + string(i) + " TO " + string(j))
            }
        }
        
        if low_y_check {
            star_distance = point_distance(current_star.x, high_y_border, check_star.x, check_star.y) 
            point = instance_create(current_star.x, high_y_border, obj_point)
            point.number = current_star.number
            if star_distance <= check_distance {
                border_case = true
                print("CONNECT " + string(i) + " TO " + string(j))
            }
        }
        
        if high_y_check {
            star_distance = point_distance(current_star.x, low_y_border, check_star.x, check_star.y)
            point = instance_create(current_star.x, low_y_border, obj_point)
            point.number = current_star.number
            if star_distance <= check_distance {
                border_case = true
                print("CONNECT " + string(i) + " TO " + string(j))
            }
        }
        
        if add_star = true {
            current_star.connections = array_insert(current_star.connections, check_star)
            check_star.connections   = array_insert(check_star.connections, current_star)
        }
        
        added = in_array(current_star.connections, check_star) 
        if border_case = true and added = false {
            current_star.border_connections = array_insert(current_star.connections, check_star)
            check_star.border_connections   = array_insert(check_star.connections, current_star)
        }
    }
}



