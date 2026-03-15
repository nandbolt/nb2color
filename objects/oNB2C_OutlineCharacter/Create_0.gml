/// @desc Palette Swap Character Example

// Sprite
outlines = [new Color(c_white), new Color(c_lime), new Color(c_yellow)];
outline_idx = 0;
outline_shaders = [shdrOutline, shdrFullOutline];
outline_shader_idx = 0;

// Uniforms
u_outline_color = shader_get_uniform(shdrOutline, "u_uOutlineColor");
u_texel_width = shader_get_uniform(shdrOutline, "u_uTexelWidth");
u_texel_height = shader_get_uniform(shdrOutline, "u_uTexelHeight");

/// @func   change_outline(idx);
/// @param {Real} idx The new outline index
/// @desc Changes the outline, looping if out of range.
change_outline = function(_idx)
{
    var _last_outline_idx = array_length(outlines) - 1;
    if (_idx > _last_outline_idx)
    {
        _idx = 0;
        change_outline_shader(outline_shader_idx+1);
    }
    else if (_idx < 0)
    {
        _idx = _last_outline_idx;
        change_outline_shader(outline_shader_idx-1);
    }
    outline_idx = _idx;
}

/// @func   change_outline_shader(idx);
/// @param {Real} idx The new outline shader index
/// @desc Changes the outline shader, looping if out of range.
change_outline_shader = function(_idx)
{
    var _last_outline_shader_idx = array_length(outline_shaders) - 1;
    if (_idx > _last_outline_shader_idx)
    {
        _idx = 0;
    }
    else if (_idx < 0)
    {
        _idx = _last_outline_shader_idx;
    }
    outline_shader_idx = _idx;
    
    u_outline_color = shader_get_uniform(outline_shaders[_idx], "u_uOutlineColor");
    u_texel_width = shader_get_uniform(outline_shaders[_idx], "u_uTexelWidth");
    u_texel_height = shader_get_uniform(outline_shaders[_idx], "u_uTexelHeight");
}