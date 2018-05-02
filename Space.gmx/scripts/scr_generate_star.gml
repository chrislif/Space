min_range = 64
max_range = 128

x_border = 450
y_border = 320

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
return star
