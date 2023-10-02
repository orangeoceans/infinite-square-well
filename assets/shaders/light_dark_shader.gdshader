shader_type canvas_item;

uniform bool dark_mode = true;

void fragment() {
    vec4 color = texture(TEXTURE, UV);
	if (dark_mode)
    	color = vec4(vec3(1.0) - color.rgb, color.a);
    COLOR = color;
}