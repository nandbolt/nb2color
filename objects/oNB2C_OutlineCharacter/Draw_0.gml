shader_set(outline_shaders[outline_shader_idx]);

var _c = outlines[outline_idx];
shader_set_uniform_f(u_outline_color, _c.r, _c.g, _c.b, _c.a);
var _tex = sprite_get_texture(sprite_index, image_index);
var _texel_width = texture_get_texel_width(_tex);
var _texel_height = texture_get_texel_height(_tex);
shader_set_uniform_f(u_texel_width, _texel_width);
shader_set_uniform_f(u_texel_height, _texel_height);

draw_self();

shader_reset();