#version 120
#define ORIGO_GLSL_FRAGMENT_SHADER
#define lowp
#define mediump
#define highp
#define ORIGO_GL_EXT_shader_framebuffer_fetch 0
#define ORIGO_GL_NV_shader_framebuffer_fetch 0
#define ORIGO_UNUSED_MAIN_IS_ALREADY_MAIN main
                        

varying lowp vec4 v_color;
varying mediump vec2 v_uv;

uniform vec4 iFogColor;
uniform vec4 viewport;

uniform sampler2D texture0;
uniform sampler2D texture1;

void main(void) {
	lowp vec4 water = texture2D(texture0, v_uv, iFogColor.w/* mipbias */);
	lowp vec4 texel = texture2D(texture1, gl_FragCoord.xy * viewport.xy);

	gl_FragColor = mix(water+texel, v_color, v_color.a) * vec4(1.0, 0.0, 0.0, 0.0);
	gl_FragColor.a = water.a;
}
