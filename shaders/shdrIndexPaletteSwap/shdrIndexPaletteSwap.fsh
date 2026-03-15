//
// Index palette swap fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D u_uPalette;
uniform float u_uPaletteSize;
uniform vec2 u_uUVTopLeft;
uniform vec2 u_uUVBottomRight;

vec4 apply_index_palette_swap(vec4 c, sampler2D palette, float palette_size, vec2 uv1, vec2 uv2)
{
    vec2 uv = vec2(uv1.x + (c.r + 1. / (palette_size * 2.)) * (uv2.x - uv1.x), uv1.y);
    return vec4(texture2D(palette, uv).rgb, c.a);
}

void main()
{
    vec4 c = texture2D( gm_BaseTexture, v_vTexcoord );
    c = apply_index_palette_swap(c, u_uPalette, u_uPaletteSize, u_uUVTopLeft, u_uUVBottomRight);
    gl_FragColor = v_vColour * c;
}
