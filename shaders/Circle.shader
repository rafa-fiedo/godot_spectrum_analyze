shader_type canvas_item;

uniform float radius = 0.1;

const float PI = 3.14159265358979323846;
const float r_size = 0.015;

float circle(vec2 uv, vec2 center_coords, vec2 i_res, float r){
	vec2 center = uv - center_coords;
	center.x = center.x * (i_res.x / i_res.y);

	// big circle
	float val = 1.0 - smoothstep(r, r + r_size, length(center));
	// small circle
	float val2 = 1.0 - smoothstep(r - r_size, r, length(center));
	float val3 = smoothstep(0.2, 0.7, r);
	
	return max(val - val2 - val3, 0.0);
}

void fragment(){
	vec2 ps = SCREEN_PIXEL_SIZE;
	vec2 i_res = 1.0 / SCREEN_PIXEL_SIZE;
	vec4 col = texture(SCREEN_TEXTURE, SCREEN_UV);
	vec4 glow = col;
	vec4 col_ring = vec4(vec3(sin(TIME * .050)), 1.0);
	
	float plot_value = circle(UV, vec2(0.5, 0.5), i_res, radius);
	
	COLOR = plot_value * col_ring;
	
}