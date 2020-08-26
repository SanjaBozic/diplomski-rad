#version 140
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable
#extension GL_ARB_explicit_attrib_location : enable
layout(location = 0) in  vec4 texCoords;  
layout(location = 0) out vec4 outColor;
uniform vec4 vTexCoordScaleOffset;
uniform sampler2D sampler15;  
  
void main()  
{  
vec2 texCoords = texCoords.xy * vTexCoordScaleOffset.xy + vTexCoordScaleOffset.zw;
outColor = texture( sampler15, texCoords );  
}  