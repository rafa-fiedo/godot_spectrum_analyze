shader_type canvas_item;

uniform float radius = 3.0;
uniform float amount = 0.85;

//void fragment(){
//	vec4 col = texture(SCREEN_TEXTURE, SCREEN_UV);
//	if(col.r == 0.0 && col.g == 0.0 && col.b == 0.0){
//		COLOR = col;
//		return;
//	}
//	COLOR = vec4(1.0, 0.0, 0.0, 1.0);
//
//}

void fragment(){
	
	float r = radius;
	vec2 ps = SCREEN_PIXEL_SIZE;
	vec4 col = texture(SCREEN_TEXTURE, SCREEN_UV);
	vec4 glow = col;

	glow += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(-r, -r) * ps);
	glow += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(-r, 0.0) * ps);
	glow += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(-r, r) * ps);
	glow += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(0.0, -r) * ps);
	glow += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(0.0, r) * ps);
	glow += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(r, -r) * ps);
	glow += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(r, 0.0) * ps);
	glow += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(r, r) * ps);

	r *= 2.0;
	glow += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(-r, -r) * ps);
	glow += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(-r, 0.0) * ps);
	glow += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(-r, r) * ps);
	glow += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(0.0, -r) * ps);
	glow += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(0.0, r) * ps);
	glow += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(r, -r) * ps);
	glow += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(r, 0.0) * ps);
	glow += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(r, r) * ps);

	glow /= 17.0;
	glow *= amount;
	col.rgb *= col.a;
	
	COLOR = glow + col;
}

//void fragment(){
//	float radius = 2.0;
//	float amount = 0.6;
//
//	float r = radius;
//	vec2 ps = TEXTURE_PIXEL_SIZE;
//	vec4 col = texture(SCREEN_TEXTURE, SCREEN_UV);
//
//	vec4 glow = col;
//	glow += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(-r, -r) * ps);
//	glow += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(-r, 0.0) * ps);
//	glow += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(-r, r) * ps);
//	glow += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(0.0, -r) * ps);
//	glow += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(0.0, r) * ps);
//	glow += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(r, -r) * ps);
//	glow += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(r, 0.0) * ps);
//	glow += texture(SCREEN_TEXTURE, SCREEN_UV + vec2(r, r) * ps);
//
//	glow /= 9.0;
//	glow *= amount;
//
//	col.rgb *= col.a;
//	COLOR = glow + col;
//
//}