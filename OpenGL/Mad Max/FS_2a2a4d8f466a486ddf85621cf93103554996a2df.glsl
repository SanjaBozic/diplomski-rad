varying vec2 v_texCoord;
uniform sampler2D s_texture;
uniform float alpha;
void main(){
vec4 texColor = texture2D(s_texture, v_texCoord);
(gl_FragColor = (texColor * alpha));
}
