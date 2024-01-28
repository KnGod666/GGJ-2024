shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

vec3 palette(float t) {
	//return texture(gradient,vec2(t)).xyz;
    return 0.5+0.5*cos(6.28318*(t+vec3(0.3,0.416,0.557)));
}

mat2 rot2D(float a) {
    return mat2(vec2(cos(a), -sin(a)), vec2(sin(a), cos(a)));
}

float sdHexPrism( vec3 p, vec2 h )
{
  const vec3 k = vec3(-0.8660254, 0.5, 0.57735);
  p = abs(p);
  p.xy -= 2.0*min(dot(k.xy, p.xy), 0.0)*k.xy;
  vec2 d = vec2(
       length(p.xy-vec2(clamp(p.x,-k.z*h.x,k.z*h.x), h.x))*sign(p.y-h.x),
       p.z-h.y );
  return min(max(d.x,d.y),0.0) + length(max(d,0.0));
}

float sdTorus( vec3 p, vec2 t )
{
  vec2 q = vec2(length(p.xz)-t.x,p.y);
  return length(q)-t.y;
}

float sdSphere(vec3 p, float s) {
    return length(p)-s;
}

float map(vec3 p){
	float sphere = sdSphere(p,0.5);
	p.z += 0.2;
	p.xy = fract(p.xy)-0.2;
	 p.z =  mod(p.z, 1); // spacing: .25
	p.xz *= rot2D(sin(TIME)*2.0);
	return min(sphere,sdHexPrism(p,vec2(0.05,0.05)));
}

void fragment() {
	 // Initialization
    vec3 ro = vec3(-1.4, -1.4, -3);         // ray origin
    vec3 rd = normalize(vec3(UV, 1)); // ray direction
    vec3 col = vec3(0);               // final pixel color

    float t = 0.0; // total distance travelled

    int i; // Raymarching
    for (int i = 0; i < 80; i++) {
        vec3 p = ro + rd * t; // position along the ray

        p.y += sin(t*0.8)*0.4;  // wiggle ray

        float d = map(p);     // current distance to the scene
        t += d;               // "march" the ray


        if (d < .001 || t > 100.) break; // early stop
    }
	COLOR = vec4(palette(t*0.05*sin(TIME/2.0)),1);
	
	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
