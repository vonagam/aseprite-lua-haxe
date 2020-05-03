package aseprite;


/**
  Represents the [color space/profile](https://www.aseprite.org/docs/color-profile/)
  of a [sprite](https://github.com/aseprite/api/blob/master/api/sprite.md#sprite), [image](https://github.com/aseprite/api/blob/master/api/image.md#image), or [image spec](https://github.com/aseprite/api/blob/master/api/imagespec.md#imagespec).
**/
@:native( "_G.ColorSpace" ) extern class ColorSpace {

  /**
    ```lua
    local cs = ColorSpace()
    local colorSpaceName = cs.name
    ```
    
    Get/sets the color space name.
  **/
  var name: String;
  
  /**
    ```lua
    local none = ColorSpace()
    local srgb = ColorSpace{ sRGB }
    local icc = ColorSpace{ fromFile="/path/file.icc" }
    ```
    
    Creates an empty color space, sRGB color space, or loads a color
    profile from the given ICC file specified in `fromFile` parameter.
  **/
  @:selfCall function new( ?options: EitherType3< ColorSpace, { sRGB: Any }, { fromFile: String } > );

}
