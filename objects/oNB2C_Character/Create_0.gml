/// @desc Palette Swap Character Example

// Sprite
palettes = [sNB2C_CharacterPalette1, sNB2C_CharacterPalette2, sNB2C_CharacterPalette3];
palette_idx = 0;
palette_size = sprite_get_width(palettes[palette_idx]);

// Uniforms
u_palette = shader_get_sampler_index(shdrIndexPaletteSwap, "u_uPalette");
u_palette_size = shader_get_uniform(shdrIndexPaletteSwap, "u_uPaletteSize");
u_uv_top_left = shader_get_uniform(shdrIndexPaletteSwap, "u_uUVTopLeft");
u_uv_bottom_right = shader_get_uniform(shdrIndexPaletteSwap, "u_uUVBottomRight");

// Textures + UVs
tex_palette = sprite_get_texture(palettes[palette_idx], 0);
uvs_palette = texture_get_uvs(tex_palette);

/// @func   change_palette(idx);
/// @param {Real} idx The new palette index
/// @desc Changes the palette, looping if out of range.
change_palette = function(_idx)
{
    var _last_palette_idx = array_length(palettes) - 1;
    if (_idx > _last_palette_idx)
    {
        _idx = 0;
    }
    else if (_idx < 0)
    {
        _idx = _last_palette_idx;
    }
    palette_idx = _idx;
    
    palette_size = sprite_get_width(palettes[palette_idx]);
    tex_palette = sprite_get_texture(palettes[palette_idx], 0);
    uvs_palette = texture_get_uvs(tex_palette);
}