star_map[0] = 0
randomize()
//width = 924
//height = 668

star_x = 0
star_y = 0
min_range = 64
max_range = 128
x_border = 458
y_border = 330
star_count = random_round(24, 36)

for (i = 0; i < star_count; i += 1) {
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
    star = instance_create(room_width/2 + star_x, room_height/2 + star_y, obj_ui_map_star)
    star_map[i] = star
}



return(star_map)
