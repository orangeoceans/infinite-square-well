shader_type canvas_item;

// Define the special coordinates and their value values
uniform vec2 coord1 = vec2(90.0, 70.0);
uniform vec2 coord2 = vec2(160.0, 80.0);
uniform vec2 coord3 = vec2(80.0, 160.0);
uniform vec2 coord4 = vec2(140.0, 170.0);

uniform bool is_horizontal = true;

uniform sampler2D source_texture;

float distance_weighted_value(vec2 point, vec2 coord, float value) {
    float d = distance(point, coord);
    // Avoid zero division
    if(d == 0.0) d = 0.0001;
    return value / d;
}

float calculate_pixel_value(vec2 coord) {
    float weighted_value_sum = 
          distance_weighted_value(coord, coord1, 0.5*sin(TIME)+0.5)
        + distance_weighted_value(coord, coord2, 0.5*cos(0.6*TIME)+0.5)
        + distance_weighted_value(coord, coord3, 0.5*sin(1.5*TIME)+0.5)
        + distance_weighted_value(coord, coord4, 0.5*cos(2.0*TIME)+0.5);
        
    float weight_sum = 
          1.0 / distance(coord, coord1)
        + 1.0 / distance(coord, coord2)
        + 1.0 / distance(coord, coord3)
        + 1.0 / distance(coord, coord4);

    return weighted_value_sum / weight_sum;
}

const int N = 256;
const float floatN = 256.0;

vec2 IFFT1D(vec2 samples[N], int index, bool is_even) {
    vec2 even[128];
    vec2 odd[128];
    vec2 result;

    // Simulate the split
    for (int i = 0; i < N; i++) {
        vec2 sample = samples[i];
        if (i % 2 == 0) {
            even[i/2] = sample;
        } else {
            odd[i/2] = sample;
        }
    }

    // Notice the sign change for IFFT in the exponential term
    float c_part = 6.28318530718 * (float(index) / float(N)); 
    vec2 exp_out = vec2(cos(c_part), sin(c_part));

    vec2 mult_out = vec2(exp_out.x * odd[index].x + exp_out.y * odd[index].y,
                         exp_out.y * odd[index].x - exp_out.x * odd[index].y);

    result = is_even ? even[index] + mult_out : even[index] - mult_out;
    
    return result; // Normalization for IFFT
}

void fragment() {
    vec2 samples[N];
    for (int i = 0; i < N; i++) {
        vec2 uv = is_horizontal ? vec2(float(i) / floatN, UV.y) : vec2(UV.x, float(i) / floatN);
        samples[i] = is_horizontal ? vec2(calculate_pixel_value(uv*256.0), 0.0) : texture(source_texture, uv).rg;  // Imaginary part is 0
    }

    int index = is_horizontal ? int(UV.x * floatN) : int(UV.y * floatN);

    vec2 result = IFFT1D(samples, index, true);
	COLOR = is_horizontal ? vec4(result, 0.0, 1.0) : vec4(vec3(result.x),1.0);
	/*
	vec3 debugColor = vec3(max(-value, 0.0), max(value, 0.0), 0.0);  // Red for negative, green for positive
	if (abs(value) < 0.01) {  // Close to zero
    	debugColor.b = 1.0;
	}
	COLOR = vec4(debugColor, 1.0);
	*/
}