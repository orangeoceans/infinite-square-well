shader_type canvas_item;

// Define the special coordinates and their value values
uniform vec2 coord1 = vec2(80.0, 80.0);
uniform vec2 coord2 = vec2(160.0, 80.0);
uniform vec2 coord3 = vec2(80.0, 160.0);
uniform vec2 coord4 = vec2(160.0, 160.0);

float distance_weighted_value(vec2 point, vec2 coord, float value) {
    float d = distance(point, coord);
    // Avoid zero division
    if(d == 0.0) d = 0.0001;
    return value / d;
}

float calculate_pixel_value(vec2 coord) {
    float weighted_value_sum = 
          distance_weighted_value(coord, coord1, sin(TIME))
        + distance_weighted_value(coord, coord2, cos(0.6*TIME))
        + distance_weighted_value(coord, coord3, sin(1.5*TIME))
        + distance_weighted_value(coord, coord4, cos(2.0*TIME));
        
    float weight_sum = 
          1.0 / distance(coord, coord1)
        + 1.0 / distance(coord, coord2)
        + 1.0 / distance(coord, coord3)
        + 1.0 / distance(coord, coord4);

    return weighted_value_sum / weight_sum;
}

void fragment() {
    COLOR = vec4(vec3(calculate_pixel_value(UV*256.0)), 1.0);
}