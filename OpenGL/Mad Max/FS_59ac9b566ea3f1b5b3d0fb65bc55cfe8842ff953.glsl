varying vec2 v_texCoord;
uniform sampler2D s_texture;
void main(){
vec4 texColor = texture2D(s_texture, v_texCoord);
(gl_FragColor = vec4(texColor.xyz, 1.0));
}
