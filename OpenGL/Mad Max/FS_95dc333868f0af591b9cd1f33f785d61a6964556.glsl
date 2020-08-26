varying vec2 v_texCoord;
uniform sampler2D s_texture;
uniform sampler2D s_mask;
uniform vec2 maskTexCoordScale;
uniform vec2 maskTexCoordOffset;
uniform float alpha;
void main(){
vec4 texColor = texture2D(s_texture, v_texCoord);
vec2 maskTexCoord = vec2((maskTexCoordOffset.x + (v_texCoord.x * maskTexCoordScale.x)), (maskTexCoordOffset.y + (v_texCoord.y * maskTexCoordScale.y)));
vec4 maskColor = texture2D(s_mask, maskTexCoord);
(gl_FragColor = ((texColor * alpha) * maskColor.w));
}
