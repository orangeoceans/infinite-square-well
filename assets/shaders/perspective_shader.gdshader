shader_type canvas_item;

const float perspective_factor = -0.3;
const vec2 perspective_origin = vec2(0.5, 0.5); // Center of the sprite

void vertex() {
    // Calculate the offset from the perspective origin
    vec2 offset = UV - perspective_origin;

    // Apply the perspective effect
    offset *= 1.0 - offset.y * perspective_factor;

    // Update the vertex position
    VERTEX = perspective_origin + offset * 512.;
}