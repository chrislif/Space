curr_angle = round(argument0)
dest_angle = round(argument1)

curr_angle = scr_simplify_angle(curr_angle)
dest_angle = scr_simplify_angle(dest_angle)

path = curr_angle
len_pos = 0

while path != dest_angle {
    path += 1
    len_pos += 1
    path = scr_simplify_angle(path)
}

path = curr_angle
len_neg = 0

while path != dest_angle {
    path -= 1
    len_neg += 1
    path = scr_simplify_angle(path)
}

if len_pos >= len_neg {
    return 1
}
else {
    return -1
}

