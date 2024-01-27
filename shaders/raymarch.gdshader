shader_type canvas_item;
uniform vec3 iMouse;
// 2D rotation function
mat2 rot2D(float a) {
    return mat2(vec2(cos(a), -sin(a)), vec2(sin(a), cos(a)));
}

// Custom gradient - https://iquilezles.org/articles/palettes/
vec3 palette(float t) {
	//return texture(gradient,vec2(t)).xyz;
    return 0.5+0.5*cos(6.28318*(t+vec3(0.3,0.416,0.557)));
}

// Octahedron SDF - https://iquilezles.org/articles/distfunctions/
float sdOctahedron(vec3 p, float s) {
    return length(p)-s;
}

// Scene distance
float map(vec3 p) {
    p.z += TIME * 0.2; // Forward movement
    
    // Space repetition
    p.xy = fract(p.xy) - 0.5;     // spacing: 1
    p.z =  mod(p.z, 0.25) - 0.125; // spacing: .25
    
    return sdOctahedron(p, 0.10); // Octahedron
}

void mainImage( out vec4 fragColor, in vec2 fragCoord, in vec2 iResolution ) {
	
    vec2 uv = (fragCoord * 2. - iResolution.xy) / iResolution.y;
    vec2  m = (iMouse.xy * 2. - iResolution.xy) / iResolution.y;
    
    // Default circular motion if mouse not clicked
    if (iMouse.z <= 0.) m = vec2(cos(TIME*.2), sin(TIME*.2));

    // Initialization
    vec3 ro = vec3(0, 0, -3);         // ray origin
    vec3 rd = normalize(vec3(uv, 1)); // ray direction
    vec3 col = vec3(0);               // final pixel color

    float t = 0.0; // total distance travelled

    int i; // Raymarching
    for (int i = 0; i < 80; i++) {
        vec3 p = ro + rd * t; // position along the ray
        
        p.xy *= rot2D(t*0.15 * m.x);     // rotate ray around z-axis

        p.y += sin(t*(m.y+1.)*0.8)*0.4;  // wiggle ray

        float d = map(p);     // current distance to the scene
        t += d;               // "march" the ray


        if (d < .001 || t > 100.) break; // early stop
    }
    // Coloring
    col = palette(t*0.04 + float(i)*0.005);
	//col = texture(gradient,vec2(t*0.07, float(i)*0.1)*vec2(mod(sin(TIME)+0.6,1.0),mod(cos(TIME)+0.2,1.0))).xyz;
    //col = vec3(normalize(iResolution),0);

    fragColor = vec4(col, 1);
    //fragColor = vec4(normalize(vec2(gl_FragCoord.xy)*iMouse.xy),1*iMouse.z,1);
}
void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 iResolution = vec2(1.0/SCREEN_PIXEL_SIZE.x,1.0/SCREEN_PIXEL_SIZE.y);
	mainImage(COLOR,FRAGCOORD.xy, iResolution);
	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
