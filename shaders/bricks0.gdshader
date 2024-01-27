shader_type canvas_item;

vec3 palette(float t) {
	//return texture(gradient,vec2(t)).xyz;
    return 0.5+0.5*cos(6.28318*(t+vec3(0.4,0.216,0.557)));
}

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	COLOR = texture(TEXTURE,UV)*vec4(palette(fract(TIME/5.0)),1);
	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
