//
// Full outline fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 u_uOutlineColor;
uniform float u_uTexelWidth;
uniform float u_uTexelHeight;

float get_max_cardinal_alpha(float wtexel, float htexel)
{
    float right_alpha = texture2D( gm_BaseTexture, vec2(v_vTexcoord.x+wtexel, v_vTexcoord.y) ).a;
    float left_alpha = texture2D( gm_BaseTexture, vec2(v_vTexcoord.x-wtexel, v_vTexcoord.y) ).a;
    float bottom_alpha = texture2D( gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y+htexel) ).a;
    float top_alpha = texture2D( gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y-htexel) ).a;
    return max(max(right_alpha, left_alpha), max(bottom_alpha, top_alpha));
}

float get_max_diagonal_alpha(float wtexel, float htexel)
{
    float top_right_alpha = texture2D( gm_BaseTexture, vec2(v_vTexcoord.x+wtexel, v_vTexcoord.y-htexel)).a;
    float top_left_alpha = texture2D( gm_BaseTexture, vec2(v_vTexcoord.x-wtexel, v_vTexcoord.y-htexel)).a;
    float bottom_right_alpha = texture2D( gm_BaseTexture, vec2(v_vTexcoord.x+wtexel, v_vTexcoord.y+htexel)).a;
    float bottom_left_alpha = texture2D( gm_BaseTexture, vec2(v_vTexcoord.x-wtexel, v_vTexcoord.y+htexel)).a;
    return max(max(top_right_alpha, top_left_alpha), max(bottom_right_alpha, bottom_left_alpha));
}

vec4 apply_full_outline(vec4 c, vec4 outline_col, float wtexel, float htexel)
{
    float cardinal_alpha = get_max_cardinal_alpha(wtexel, htexel);
    float diagonal_alpha = get_max_diagonal_alpha(wtexel, htexel);
    return c + outline_col * (1. - c.a) * max(cardinal_alpha, diagonal_alpha);
}

void main()
{
    vec4 c = texture2D( gm_BaseTexture, v_vTexcoord );
    c = v_vColour * c;
    c = apply_full_outline(c, u_uOutlineColor, u_uTexelWidth, u_uTexelHeight);
    gl_FragColor = c;
}
