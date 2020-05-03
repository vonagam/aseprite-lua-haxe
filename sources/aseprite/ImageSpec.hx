package aseprite;


/**
  It's a simple structure that contains some specifications of a
  [sprite](https://github.com/aseprite/api/blob/master/api/sprite.md#sprite) or [image](https://github.com/aseprite/api/blob/master/api/image.md#image) (like canvas size,
  [color mode](https://github.com/aseprite/api/blob/master/api/colormode.md#colormode), etc.)
**/
@:native( "_G.ImageSpec" ) extern class ImageSpec {

  /**
    ```lua
    local colorMode = spec.colorMode
    spec.colorMode = colorMode
    ```
    
    The [color mode](https://github.com/aseprite/api/blob/master/api/colormode.md#colormode) of the image.
  **/
  var colorMode: ColorMode;
  
  var colorSpace: ColorSpace;
  
  /**
    ```lua
    local w = spec.width
    spec.width = w
    ```
    
    Canvas width.
  **/
  var width: Int;
  
  /**
    ```lua
    local h = spec.height
    spec.height = h
    ```
    
    Canvas height.
  **/
  var height: Int;
  
  /**
    ```lua
    local mask = spec.transparentColor
    spec.transparentColor = mask
    ```
    
    Index in the palette that represent the transparent color in
    transparent layers in indexed sprites.
  **/
  var transparentColor: PixelColor;
  
  @:selfCall function new( options: EitherType2< ImageSpec, { ?width: Int, ?height: Int, ?colorMode: ColorMode, ?transparentColor: PixelColor } > );

}
