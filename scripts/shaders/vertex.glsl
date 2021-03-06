#version 150

// In
in vec3 in_Position;
in vec4 in_Color;
in vec3 in_Normal;
in vec2 in_TexCoord;

// Out
out vec3 ex_Position;
out vec4 ex_Color;
out vec3 ex_Normal;
out vec2 ex_TexCoord;
out vec3 mc_Position;
out vec3 noise_pos;

// Matrix
uniform mat4 ModelMatrix;
uniform mat3 NormalMatrix;
layout(std140) uniform SharedMatrices
{
	mat4 ViewMatrix;
	mat4 ProjectionMatrix;
};

void main(void)
{
	ex_Color = in_Color;
	ex_Normal = normalize(NormalMatrix * in_Normal);
	ex_Position = vec3(ViewMatrix * ModelMatrix * vec4(in_Position, 1.0));
	gl_Position = ProjectionMatrix * ViewMatrix * ModelMatrix * vec4(in_Position, 1.0);
	ex_TexCoord = in_TexCoord;
	noise_pos = vec3(ProjectionMatrix * ModelMatrix * vec4(in_Position, 1.0));
	float noiseScale = 0.04;
	mc_Position = in_Position * noiseScale;
}
