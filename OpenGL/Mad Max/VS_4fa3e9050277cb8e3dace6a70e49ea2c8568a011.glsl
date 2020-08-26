attribute vec4 a_position;
attribute vec2 a_texCoord;
attribute float a_index;
uniform mat4 matrix[8];
uniform vec4 texTransform[8];
uniform float opacity[32];
varying vec2 v_texCoord;
varying float v_alpha;
void main(){
int quad_index = int((a_index * 0.25));
(gl_Position = (matrix[int(clamp(float(quad_index), 0.0, float(7)))] * a_position));
vec4 texTrans = texTransform[int(clamp(float(quad_index), 0.0, float(7)))];
(v_texCoord = ((a_texCoord * texTrans.zw) + texTrans.xy));
(v_alpha = opacity[int(clamp(float(int(a_index)), 0.0, float(31)))]);
}
