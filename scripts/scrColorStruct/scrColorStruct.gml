/// @func   Color(constant, alpha);
/// @param {Constant.Color} constant
/// @desc A color that holds each individual rgb component, normalized from 0-1.
/// This is for ease of use in shaders.
function Color(_constant=c_white, _alpha=1)
{
    r = colour_get_red(_constant) / 255;
    g = colour_get_green(_constant) / 255;
    b = colour_get_blue(_constant) / 255;
    a = _alpha;
    
    #region Setters
    
    /// @func   set_red(r);
    /// @param {Real} r Red (0-255)
    /// @desc Sets the red color component, normalizing the value.
    static set_red = function(_r)
    {
        r = _r / 255;
    }
    
    /// @func   set_green(g);
    /// @param {Real} g Green (0-255)
    /// @desc Sets the green color component, normalizing the value.
    static set_green = function(_g)
    {
        g = _g / 255;
    }
    
    /// @func   set_blue(b);
    /// @param {Real} b Blue (0-255)
    /// @desc Sets the blue color component, normalizing the value.
    static set_blue = function(_b)
    {
        b = _b / 255;
    }
    
    #endregion
    
    #region Properties
    
    /// @func   get_red_unnormalized();
    /// @desc Returns the unnormalized red (0-255).
    static get_red_unnormalized = function()
    {
        return r * 255;
    }
    
    /// @func   get_green_unnormalized();
    /// @desc Returns the unnormalized green (0-255).
    static get_green_unnormalized = function()
    {
        return g * 255;
    }
    
    /// @func   get_blue_unnormalized();
    /// @desc Returns the unnormalized blue (0-255).
    static get_blue_unnormalized = function()
    {
        return g * 255;
    }
    
    #endregion
}