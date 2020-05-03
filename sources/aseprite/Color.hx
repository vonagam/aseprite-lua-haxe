package aseprite;


/**
  Represents a color that can be choose by the user in different kinds
  (RGB, HSV, HSL, grayscale, indexed).
  
  Don't confuse this color with the [app.pixelColor](https://github.com/aseprite/api/blob/master/api/pixelcolor.md#apppixelcolor)
  which is used to put/get pixels to/from an [image](https://github.com/aseprite/api/blob/master/api/image.md#image).
**/
@:native( "_G.Color" ) extern class Color {

  var red: Int;
  
  var green: Int;
  
  var blue: Int;
  
  /**
    ```lua
    local c = Color{ r=0, g=0, b=0, a=128 }
    assert(c.alpha == 128)
    ```
  **/
  var alpha: Int;
  
  var hsvHue: Float;
  
  var hsvSaturation: Float;
  
  var hsvValue: Float;
  
  var hslHue: Float;
  
  var hslSaturation: Float;
  
  var hslLightness: Float;
  
  /**
    Gets/sets the [HSV hue](https://github.com/aseprite/api/blob/master/api/color.md#colorhsvhuesaturationvalue) or [HSL hue](https://github.com/aseprite/api/blob/master/api/colorhslhuesaturationligthness) depending on the kind of color.
  **/
  var hue: Float;
  
  /**
    Gets/sets the [HSV saturation](https://github.com/aseprite/api/blob/master/api/color.md#colorhsvhuesaturationvalue) or [HSL saturation](https://github.com/aseprite/api/blob/master/api/colorhslhuesaturationligthness) depending on the kind of color.
  **/
  var saturation: Float;
  
  /**
    Gets/sets the [HSV value](https://github.com/aseprite/api/blob/master/api/color.md#colorhsvhuesaturationvalue).
  **/
  var value: Float;
  
  /**
    Gets/sets the [HSL lightness](https://github.com/aseprite/api/blob/master/api/colorhslhuesaturationligthness).
  **/
  var lightness: Float;
  
  var index: Float;
  
  var gray: Float;
  
  /**
    ```lua
    local c = Color{ r=200, g=100, b=0, a=255 }
    assert(c.rgbaPixel == app.pixelColor.rgba(200, 100, 0, 255))
    ```
    
    Returns the [pixel color](https://github.com/aseprite/api/blob/master/api/pixelcolor.md#apppixelcolorrgba) which is
    equivalent to the RGBA values of this color.
  **/
  var rgbaPixel( default, null ): PixelColor;
  
  /**
    Returns the [pixel color](https://github.com/aseprite/api/blob/master/api/pixelcolor.md#apppixelcolorgraya) which is
    equivalent to the gray+alpha values of this color.
  **/
  var grayPixel( default, null ): PixelColor;
  
  /**
    ```lua
    local c
    c = Color{ r=255, g=255, b=255, a=255 }
    c = Color{ h=360.0, s=1.0, v=1.0, a=255 }
    c = Color{ h=360.0, s=1.0, l=1.0, a=255 }
    c = Color{ red=255, green=255, blue=255, alpha=255 }
    c = Color{ hue=360.0, saturation=1.0, value=1.0, alpha=255 }
    c = Color{ hue=360.0, saturation=1.0, lightness=1.0, alpha=255 }
    c = Color{ gray=255, alpha=255 }
    c = Color(integer)
    ```
    
    * If `alpha` argument is not specified, it's 255 by default (opacity = 100%).
    * The `Color(integer)` constructor receives a [pixel color](https://github.com/aseprite/api/blob/master/api/pixelcolor.md#apppixelcolor)
      and the integer is interpreted depending on the [active sprite](https://github.com/aseprite/api/blob/master/api/app.md#appactivesprite).
  **/
  @:overload( function( options: { r: IntInput, g: IntInput, b: IntInput, ?a: IntInput } ): Void {} )
  @:overload( function( options: { red: IntInput, green: IntInput, blue: IntInput, ?alpha: IntInput } ): Void {} )
  @:overload( function( options: { h: FloatInput, s: FloatInput, v: FloatInput, ?a: IntInput } ): Void {} )
  @:overload( function( options: { hue: FloatInput, saturation: FloatInput, value: FloatInput, ?alpha: IntInput } ): Void {} )
  @:overload( function( options: { h: FloatInput, s: FloatInput, l: FloatInput, ?a: IntInput } ): Void {} )
  @:overload( function( options: { hue: FloatInput, saturation: FloatInput, lightness: FloatInput, ?alpha: IntInput } ): Void {} )
  @:overload( function( options: { gray: FloatInput, ?alpha: IntInput } ): Void {} )
  @:overload( function( values: haxe.extern.Rest< Int > ): Void {} )
  @:selfCall function new( ?options: AnyColorInput );

}
