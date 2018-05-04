randomize()

star_count = random_round(24, 36)

star_x = 0
star_y = 0

rm_width = 1024
rm_height = 768

x_border = 450
y_border = 320

min_range = 75  // Minimum displacement of stars
max_range = 150 // Maximum displacement of stars

recalc_range = 50   // Minimum range of stars next to each other
max_recalc = 32

for (i = 0; i < star_count; i += 1) {
    final_x = 0
    final_y = 0
    valid = false
    recalc_counter = 0
    
    while valid == false {
        star_x += random_sign() * random_round(min_range, max_range)        
        star_y += random_sign() * random_round(min_range, max_range)
        
        if star_x < -x_border {
            x_diff = abs(star_x) - x_border
            star_x =  x_border - x_diff 
        }
        
        if star_x > x_border {
            x_diff = star_x - x_border
            star_x = -x_border + x_diff
        }
        
        if star_y < -y_border {
            y_diff = abs(star_y) - y_border
            star_y =  y_border - y_diff
        }
        
        if star_y > y_border {
            y_diff = star_y - y_border
            star_y = -y_border + y_diff
        }
        
        final_x = rm_width/2 + star_x
        final_y = rm_height/2 + star_y
        
        nearest_star = instance_nearest(final_x, final_y, obj_ui_map_star)
        
        if nearest_star != noone {
            if final_x - nearest_star.x < recalc_range and
               final_y - nearest_star.y < recalc_range {
                if recalc_counter < max_recalc {
                    recalc_counter += 1
                } else {
                    valid = true
                }
            } else {
                valid = true
            }
        } else {
            valid = true
        }
    }
    
    star = instance_create(final_x, final_y, obj_ui_map_star)
    star.number = i
    star_map[i] = star
}

scr_connect_stars(star_map)

return(star_map)
