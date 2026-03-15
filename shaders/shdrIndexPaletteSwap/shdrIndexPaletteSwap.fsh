//
// Index palette swap fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D u_uPalette;
uniform float u_uPaletteSize;
uniform vec2 u_uUVTopLeft;
uniform vec2 u_uUVBottomRight;

void main()
{
    vec4 texcol = texture2D( gm_BaseTexture, v_vTexcoord );
    vec2 uv = vec2(u_uUVTopLeft.x + (texcol.r + 1. / (u_uPaletteSize * 2.)) * (u_uUVBottomRight.x - u_uUVTopLeft.x), u_uUVTopLeft.y);
    vec4 palcol = texture2D( u_uPalette, uv);
    gl_FragColor = v_vColour * vec4(palcol.rgb, texcol.a);
}
