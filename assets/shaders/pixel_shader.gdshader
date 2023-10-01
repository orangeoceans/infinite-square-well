shader_type canvas_item;

uniform vec4 pos = vec4(1.0, 1.0, 1.0, 1.0);

uniform sampler2D w_clouds;
uniform sampler2D x_clouds;
uniform sampler2D y_clouds;
uniform sampler2D z_clouds;
uniform sampler2D cloud_gradient;

uniform sampler2D jeff_texture;
uniform vec4 jeff_pos = vec4(1.0, 1.0, 1.0, 1.0);
const vec4 jeff_vecs[] = { 
	vec4(1, 0, 0, 0),
	vec4(0, 1, 0, 0), 
	vec4(0, 0, 0.7071, 0.7071)
};

uniform float max_pos = 100;

const float cloud_size = 2048.;
const float cloud_window = 256.;

float point_line_distance(vec4 point, vec4 line_p, vec4 line_v) {
	// Project point onto line, then calculate distance
	vec4 v = point - line_p;
	vec4 closest_p = line_p + (dot(v, line_v) * line_v);
	return clamp(distance(closest_p, point), 0.0, 1.0);
}

vec2 calc_cloud_uv(vec2 position, vec2 uv) {
	float cloud_speed = (cloud_size - cloud_window)/max_pos;
	return vec2(position[0]*cloud_speed + uv.x*cloud_window, position[1]*cloud_speed + uv.y*cloud_window)/cloud_size;
}

vec2 stretch_uv(vec2 uv, float phase, float mag, bool x_dir) {
	if (x_dir) {
		return vec2(uv.x + uv.x*mag*sin(phase) - 0.5*mag*sin(phase), uv.y);
	} else {
		return vec2(uv.x, uv.y + uv.y*mag*sin(phase) - 0.5*mag*sin(phase));
	}
}

void fragment() {
	//vec4 pos = vec4(sin(TIME)+1., sin(TIME*0.5)+1., sin(TIME*0.8)+1., sin(TIME*1.2)+1.);
	vec4 jeff_sample = texture(jeff_texture, UV); 
	vec3 jeff_dists = vec3(point_line_distance(pos, jeff_pos, jeff_vecs[0]), point_line_distance(pos, jeff_pos, jeff_vecs[1]), point_line_distance(pos, jeff_pos, jeff_vecs[2]));
	float r = clamp(jeff_sample[0] - jeff_dists[0], 0.0, 1.0);
	float g = clamp(jeff_sample[1] - jeff_dists[1], 0.0, 1.0);
	float b = clamp(jeff_sample[2] - jeff_dists[2], 0.0, 1.0);
	
	float w_clouds_sample = texture(w_clouds, calc_cloud_uv(vec2(pos[0],pos[1]), stretch_uv(1.-UV, pos[0]+pos[3], 0.2, true)))[0]/4.;
	float x_clouds_sample = texture(x_clouds, calc_cloud_uv(vec2(pos[0],pos[1]), stretch_uv(UV, pos[1]+pos[2], 0.2, false)))[0]/4.;
	float y_clouds_sample = texture(y_clouds, calc_cloud_uv(vec2(pos[2],pos[3]), stretch_uv(1.-UV, pos[1]+pos[3], 0.2, true)))[0]/4.;
	float z_clouds_sample = texture(z_clouds, calc_cloud_uv(vec2(pos[2],pos[3]), stretch_uv(UV, pos[0]+pos[2], 0.2, false)))[0]/4.;
	float clouds_sample = w_clouds_sample + x_clouds_sample + y_clouds_sample + z_clouds_sample;
	vec4 clouds_rgb = texture(cloud_gradient, vec2(clouds_sample,0));

	// COLOR = clouds_rgb;
	COLOR = vec4(
		r + clamp(clouds_rgb[0]*(0.5*jeff_dists[0] + 0.3*jeff_dists[1] + 0.3*jeff_dists[2]), 0.0, 1.0), 
		g + clamp(clouds_rgb[1]*(0.3*jeff_dists[0] + 0.5*jeff_dists[1] + 0.3*jeff_dists[2]), 0.0, 1.0), 
		b + clamp(clouds_rgb[2]*(0.3*jeff_dists[0] + 0.3*jeff_dists[1] + 0.5*jeff_dists[2]), 0.0, 1.0), 1.0);	
}