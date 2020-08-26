attribute vec4 a_position;
attribute vec2 a_texCoord;
uniform mat4 matrix;
varying vec2 v_texCoord;
uniform vec2 texScale;
uniform vec2 texOffset;
void main(){
(gl_Position = (matrix * a_position));
(v_texCoord = ((a_texCoord * texScale) + texOffset));
}
