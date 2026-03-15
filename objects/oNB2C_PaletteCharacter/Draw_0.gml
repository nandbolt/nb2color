shader_set(shdrIndexPaletteSwap);

texture_set_stage(u_palette, tex_palette);
shader_set_uniform_f(u_palette_size, palette_size);
shader_set_uniform_f(u_uv_top_left, uvs_palette[0], uvs_palette[1]);
shader_set_uniform_f(u_uv_bottom_right, uvs_palette[2], uvs_palette[3]);

draw_self();

shader_reset();