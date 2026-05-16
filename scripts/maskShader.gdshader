shader_type canvas_item;

uniform sampler2D screen_texture: hint_screen_texture;


void fragment() {
	vec4 screen_col = texture(screen_texture, SCREEN_UV);
	vec4 tex_col = texture(TEXTURE, UV);
	COLOR = vec4(screen_col.rgb, tex_col.a * COLOR.a);
}

