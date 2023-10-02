shader_type canvas_item;

void fragment() {
	vec4 color = texture(TEXTURE, UV);
	if (color.a > 0.)
		color.a = pow(0.5*sin(5.*TIME) + 0.5, 2.);
	COLOR = color;
}
