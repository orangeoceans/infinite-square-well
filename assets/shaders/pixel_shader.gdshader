shader_type canvas_item;

uniform vec4 pos = vec4(1.0, 1.0, 1.0, 1.0);

uniform sampler2D w_clouds;
uniform sampler2D x_clouds;
uniform sampler2D y_clouds;
uniform sampler2D z_clouds;
uniform sampler2D cloud_gradient;

uniform sampler2D[2] key_textures;
uniform float[2] keypoint_dists;
uniform vec3[2] point_line_dists;

uniform float max_pos = 100.;

uniform int near_key_index = -1;
uniform float near_key_dist = 0.;
uniform float speak_dist = 0.75;

const float cloud_size = 2048.;
const float cloud_window = 256.;

vec4 sample_texture_array(int index, vec2 uv) {
    if (index == 0)
        return texture(key_textures[0], uv);
    return texture(key_textures[1], uv);
}

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
	float r = 0., g = 0., b = 0.;
	vec3 nearest_dist = vec3(99999., 99999., 99999.);
	for (int i = 0; i < 2; i++) {
		float keypoint_dist = keypoint_dists[i];
		vec3 point_line_dist = point_line_dists[i];
		vec4 key_sample = sample_texture_array(i, UV); 

		float r_add = clamp(key_sample[0] - point_line_dist[0], 0.0, 1.0);
		float g_add = clamp(key_sample[1] - point_line_dist[1], 0.0, 1.0);
		float b_add = clamp(key_sample[2] - point_line_dist[2], 0.0, 1.0);
		r_add *= (1.-2.*keypoint_dist/max_pos);
		g_add *= (1.-2.*keypoint_dist/max_pos);
		b_add *= (1.-2.*keypoint_dist/max_pos);
		if (near_key_index >= 0 && i != near_key_index) {
			r_add *= clamp(near_key_dist/4., 0., 1.);
			g_add *= clamp(near_key_dist/4., 0., 1.);
			b_add *= clamp(near_key_dist/4., 0., 1.);
		}
		r += r_add;
		g += g_add;
		b += b_add;

		if (point_line_dist[0] < nearest_dist[0])
			nearest_dist[0] = point_line_dist[0];
		if (point_line_dist[1] < nearest_dist[1])
			nearest_dist[1] = point_line_dist[1];
		if (point_line_dist[2] < nearest_dist[2])
			nearest_dist[2] = point_line_dist[2];
	}
	
	float w_clouds_sample = texture(w_clouds, calc_cloud_uv(vec2(pos[0],pos[1]), stretch_uv(1.-UV, pos[0]+pos[3], 0.2, true)))[0]/4.;
	float x_clouds_sample = texture(x_clouds, calc_cloud_uv(vec2(pos[0],pos[1]), stretch_uv(UV, pos[1]+pos[2], 0.2, false)))[0]/4.;
	float y_clouds_sample = texture(y_clouds, calc_cloud_uv(vec2(pos[2],pos[3]), stretch_uv(1.-UV, pos[1]+pos[3], 0.2, true)))[0]/4.;
	float z_clouds_sample = texture(z_clouds, calc_cloud_uv(vec2(pos[2],pos[3]), stretch_uv(UV, pos[0]+pos[2], 0.2, false)))[0]/4.;
	float clouds_sample = w_clouds_sample + x_clouds_sample + y_clouds_sample + z_clouds_sample;
	vec4 clouds_rgb = texture(cloud_gradient, vec2(clouds_sample,0));

	// COLOR = clouds_rgb;
	COLOR = vec4(
		r + clamp(clouds_rgb[0]*(0.5*nearest_dist[0] + 0.25*nearest_dist[1] + 0.25*nearest_dist[2]), 0.0, 1.0), 
		g + clamp(clouds_rgb[1]*(0.25*nearest_dist[0] + 0.5*nearest_dist[1] + 0.25*nearest_dist[2]), 0.0, 1.0), 
		b + clamp(clouds_rgb[2]*(0.25*nearest_dist[0] + 0.25*nearest_dist[1] + 0.5*nearest_dist[2]), 0.0, 1.0), 1.0);
}