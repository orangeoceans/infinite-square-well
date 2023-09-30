shader_type canvas_item;

// Define a uniform for the controller to send colors
uniform sampler2D color_grid;

void vertex() {
    // No changes needed in the vertex function for this example.
}

void fragment() {
    // Fetch the color from the texture sent by the controller
    COLOR = vec4(cos(20.0*UV.x)+sin(10.0*UV.y)+sin(4.0*UV.y), sin(25.0*UV.y)-cos(15.0*UV.x), sin(20.0*UV.y), 1);
}