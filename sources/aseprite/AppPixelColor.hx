package aseprite;


/*
  This [`app`](https://github.com/aseprite/api/blob/master/api/app.md#app) property contains a set of function to handle the color
  for [Image pixels](https://github.com/aseprite/api/blob/master/api/image.md#imagepixels) at the lowest level: an unsigned integer.
  
  On Aseprite there are two kind of ways to handle colors:
  
  1. The [Color](https://github.com/aseprite/api/blob/master/api/color.md#color) object type (a high-level/abstract/user-friendly way to handle color)
  2. Or an unsigned integer (low-level/performance-wise) value which can represent several kind of colors:
     - For [RGB](https://github.com/aseprite/api/blob/master/api/colormode.md#colormodergb) images: a 32-bit unsigned integer value (8-bit for each of the four RGBA component)
     - [Gray](https://github.com/aseprite/api/blob/master/api/colormode.md#colormodegray) images: a 16-bit unsigned integer with Alpha and Grayscale value (8-bit for Alpha, 8-bit for Gray)
     - [Indexed](https://github.com/aseprite/api/blob/master/api/colormode.md#colormodeindexed) images: 8-bit unsigned
       integer which represents a value from 0 to 255 to reference a
       [palette entry](https://github.com/aseprite/api/blob/master/api/palette.md#palettegetcolor)
  
  For performance reasons, pixel values on [images](https://github.com/aseprite/api/blob/master/api/image.md#image) are
  handled with the sencond kind of colors: an unsigned integer value.
  This color format is used when you handle pixels directly with functions like
  [Image:getPixel()](https://github.com/aseprite/api/blob/master/api/image.md#imagegetpixel),
  [Image:putPixel()](https://github.com/aseprite/api/blob/master/api/image.md#imageputpixel), or
  [Image:pixels()](https://github.com/aseprite/api/blob/master/api/image.md#imagepixels).
*/
extern class AppPixelColor {

  /*
    ```lua
    local rgbaPixelValue = app.pixelColor.rgba(red, green, blue, [, alpha])
    ```
    
    Constructs a 32-bit unsigned integer for [RGBA](https://github.com/aseprite/api/blob/master/api/colormode.md#colormodergb) images.
    Alpha will be 255 (i.e. 100% opaque) if it's not specified.
    
    Example:
    
    ```lua
    local pc = app.pixelColor
    local redPixel = pc.rgba(255, 0, 0)
    local semiTransparentWhite = pc.rgba(255, 255, 255, 128)
    ```
  */
  @:luaDotMethod function rgba( r: IntInput, g: IntInput, b: IntInput, ?a: IntInput ): PixelColor;
  
  /*
    ```lua
    local redComponent = app.pixelColor.rgbaR(rgbaPixelValue)
    ```
    
    Returns the red component of the given 32-bit integer (`rgbaPixelValue`).
    This integer is a value created with [`app.pixelColor.rgba()`](https://github.com/aseprite/api/blob/master/api/apppixelcolorrgba)
    or [`Image:getPixel()`]() from a
    [RGBA](https://github.com/aseprite/api/blob/master/api/colormode.md#colormodergb) image.
    
    Note: RGB components **are not** premultiplied by alpha.
    
    Example:
    
    ```lua
    local pc = app.pixelColor
    local rgbaPixelValue = pc.rgba(255, 128, 0)
    local redComponent = pc.rgbaR(rgbaPixelValue)
    local greenComponent = pc.rgbaG(rgbaPixelValue)
    -- redComponent is 255
    -- greenComponent is 128
    ```
  */
  @:luaDotMethod function rgbaR( color: PixelColor ): Int;
  
  /*
    Same as [rgbaR()](https://github.com/aseprite/api/blob/master/api/pixelcolor.md#apppixelcolorrgbar) but with the Green component.
  */
  @:luaDotMethod function rgbaG( color: PixelColor ): Int;
  
  /*
    Same as [rgbaR()](https://github.com/aseprite/api/blob/master/api/pixelcolor.md#apppixelcolorrgbar) but with the Blue component.
  */
  @:luaDotMethod function rgbaB( color: PixelColor ): Int;
  
  /*
    Same as [rgbaR()](https://github.com/aseprite/api/blob/master/api/pixelcolor.md#apppixelcolorrgbar) but with the Alpha component.
  */
  @:luaDotMethod function rgbaA( color: PixelColor ): Int;
  
  /*
    ```lua
    local grayPixelValue = app.pixelColor.graya(gray [, alpha])
    ```
    
    Constructs a 16-bit unsigned integer for [grayscale](https://github.com/aseprite/api/blob/master/api/colormode.md#colormodegrayscale) images.
    Alpha will be 255 (i.e. 100% opaque) if it's not specified.
    
    Example:
    
    ```lua
    local pc = app.pixelColor
    local black = pc.graya(0)
    local white = pc.graya(255)
    local semiTransparentWhite = pc.graya(255, 128)
    ```
  */
  @:luaDotMethod function graya( v: IntInput, ?a: IntInput ): PixelColor;
  
  /*
    ```lua
    local grayValue = app.pixelColor.grayaV(grayPixelValue)
    ```
    
    Returns the gray component of the given 16-bit integer (`grayPixelValue`).
    This integer is a value created with [`app.pixelColor.graya()`](https://github.com/aseprite/api/blob/master/api/apppixelcolorgraya)
    or [`Image:getPixel()`]() from a [grayscale](https://github.com/aseprite/api/blob/master/api/colormode.md#colormodegray) image.
    
    Example:
    
    ```lua
    local pc = app.pixelColor
    local grayPixelValue = pc.graya(128, 32)
    local grayComponent = pc.grayaV(grayPixelValue)
    local alphaComponent = pc.grayaA(grayPixelValue)
    -- grayComponent is 128
    -- alphaComponent is 32
    ```
  */
  @:luaDotMethod function grayaV( color: PixelColor ): Int;
  
  /*
    Same as [grayaV()](https://github.com/aseprite/api/blob/master/api/pixelcolor.md#apppixelcolorgrayav) but with the Alpha component.
  */
  @:luaDotMethod function grayaA( color: PixelColor ): Int;

}
