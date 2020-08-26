varying vec2 v_texCoord;
uniform sampler2D y_texture;
uniform sampler2D u_texture;
uniform sampler2D v_texture;
uniform float alpha;
uniform vec3 yuv_adj;
uniform mat3 yuv_matrix;
void main(){
float y_raw = texture2D(y_texture, v_texCoord).x;
float u_unsigned = texture2D(u_texture, v_texCoord).x;
float v_unsigned = texture2D(v_texture, v_texCoord).x;
vec3 yuv = (vec3(y_raw, u_unsigned, v_unsigned) + yuv_adj);
vec3 rgb = (yuv_matrix * yuv);
(gl_FragColor = (vec4(rgb, 1.0) * alpha));
}
