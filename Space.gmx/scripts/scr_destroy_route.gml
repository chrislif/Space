route = argument0

for (i = 1; i <= route[0]; i += 1) {
    if route[i] != noone {
        instance_destroy(route[i])
    }
}
