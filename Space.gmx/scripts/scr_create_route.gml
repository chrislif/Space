randomize()
points = round(random_range(3,4))
new_route = noone
switch points {
    case 3:
        dist = 500
        new_route[0] = points
        new_route[1] = instance_create(x - dist/2, y - dist/2, obj_point)
        new_route[2] = instance_create(x + dist/2, y - dist/2, obj_point)
        new_route[3] = instance_create(x         , y + dist/2, obj_point)
        new_route[4] = new_route[1]
        break  
    case 4:
        dist = 500
        new_route[0] = points
        new_route[1] = instance_create(x - dist/2, y - dist/2, obj_point)
        new_route[2] = instance_create(x + dist/2, y - dist/2, obj_point)
        new_route[3] = instance_create(x + dist/2, y + dist/2, obj_point)
        new_route[4] = instance_create(x - dist/2, y + dist/2, obj_point)
        new_route[5] = new_route[1]
        break   
}
return(new_route)
