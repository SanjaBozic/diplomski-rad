attribute vec4 a_position;
attribute float a_index;
uniform mat4 matrix;
uniform vec2 quad[4];
void main(){
vec2 pos = quad[int(clamp(float(int(a_index)), 0.0, float(3)))];
(gl_Position = (matrix * vec4(pos, a_position.z, a_position.w)));
}
