#version 150
uniform float time;
uniform vec2 resolution;
uniform vec3 spectrum;

in VertexData
{
    vec4 v_position;
    vec3 v_normal;
    vec2 v_texcoord;
} inData;

out vec4 fragColor;

mat2 rot(float a) {
    float s = sin(a);
    float c = cos(a);
    return mat2(c, -s, s, c);
}

mat3 rotX(float a) {
    float s = sin(a);
    float c = cos(a);
    return mat3(1, 0, 0, 0, c, -s, 0, s, c);
}

mat3 rotY(float a) {
    float s = sin(a);
    float c = cos(a);
    return mat3(c, 0, s, 0, 1, 0, -s, 0, c);
}

mat3 rotZ(float a) {
    float s = sin(a);
    float c = cos(a);
    return mat3(c, -s, 0, s, c, 0, 0, 0, 1);
}

float scene(vec3 p, float bass, float mid, float treble) {
    // Spin the whole space based on audio
    p = rotY(time + bass * 3.0) * p;
    p = rotX(time * 0.7 + mid * 2.0) * p;
    p = rotZ(time * 0.5 + treble * 2.0) * p;
    
    // Kaleidoscope
    float angle = atan(p.y, p.x);
    float radius = length(p.xy);
    
    float segments = 8.0 + floor(bass * 8.0);
    angle = mod(angle, 3.14159 * 2.0 / segments);
    angle = abs(angle - 3.14159 / segments);
    
    p.xy = vec2(cos(angle), sin(angle)) * radius;
    
    // Twisted torus shape
    float torusR = 2.0 + sin(time + bass * 5.0) * 0.5;
    float torusr = 0.5 + mid * 0.3;
    
    vec2 q = vec2(length(p.xy) - torusR, p.z);
    float d = length(q) - torusr;
    
    // Audio-reactive displacement
    d += sin(p.x * 10.0 + time * 2.0) * 0.05 * bass;
    d += sin(p.y * 10.0 - time * 2.0) * 0.05 * mid;
    d += sin(p.z * 10.0 + time) * 0.05 * treble;
    
    return d;
}

void main(void)
{
    vec2 uv = (gl_FragCoord.xy - 0.5 * resolution.xy) / resolution.y;
    
    float bass = spectrum.x;
    float mid = spectrum.y;
    float treble = spectrum.z;
    
    // Camera orbits and zooms with audio
    float camAngle = time * 0.3;
    vec3 ro = vec3(
        sin(camAngle) * (5.0 + bass * 2.0),
        cos(time * 0.2) * 2.0 + mid * 1.0,
        cos(camAngle) * (5.0 + bass * 2.0)
    );
    
    vec3 target = vec3(0.0);
    vec3 forward = normalize(target - ro);
    vec3 right = normalize(cross(vec3(0, 1, 0), forward));
    vec3 up = cross(forward, right);
    
    vec3 rd = normalize(forward + uv.x * right + uv.y * up);
    
    // Raymarching
    float t = 0.0;
    vec3 col = vec3(0.0);
    float glow = 0.0;
    
    for(int i = 0; i < 80; i++) {
        vec3 p = ro + rd * t;
        float d = scene(p, bass, mid, treble);
        
        glow += 0.008 / (abs(d) + 0.01);
        
        if(d < 0.001) {
            // Surface color
            col = vec3(
                sin(t * 0.5 + time + bass * 5.0) * 0.5 + 0.5,
                sin(t * 0.5 + time * 1.3 + mid * 5.0) * 0.5 + 0.5,
                sin(t * 0.5 + time * 1.7 + treble * 5.0) * 0.5 + 0.5
            );
            col *= 1.0 + (bass + mid + treble) * 0.5;
            break;
        }
        
        if(t > 30.0) break;
        t += d * 0.7;
    }
    
    // Volumetric glow
    vec3 glowCol = vec3(
        0.5 + bass * 0.5,
        0.5 + mid * 0.5,
        0.5 + treble * 0.5
    );
    
    col += glowCol * glow * 0.03;
    
    // Vignette
    col *= 1.0 - length(uv) * 0.3;
    
    // Beat pulse
    col += vec3(1.0) * bass * 0.2 * (1.0 - length(uv));
    
    fragColor = vec4(col, 1.0);
}
