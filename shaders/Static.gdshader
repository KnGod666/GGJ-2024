shader_type canvas_item;

uniform sampler2D noise;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	COLOR = texture(noise,mod(UV+fract(vec2(TIME,TIME)),vec2(1,1)))*texture(TEXTURE,UV);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
