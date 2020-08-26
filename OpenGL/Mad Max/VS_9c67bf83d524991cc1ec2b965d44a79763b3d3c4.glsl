attribute vec4 a_position;
attribute vec2 a_texCoord;
attribute float a_index;
uniform mat4 matrix;
uniform vec2 quad[4];
uniform vec4 vertexTexTransform;
varying vec2 v_texCoord;
void main(){
vec2 pos = quad[int(clamp(float(int(a_index)), 0.0, float(3)))];
(gl_Position = (matrix * vec4(pos, a_position.z, a_position.w)));
(v_texCoord = ((a_texCoord * vertexTexTransform.zw) + vertexTexTransform.xy));
}
