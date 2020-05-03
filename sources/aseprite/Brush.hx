package aseprite;


/**
  Identifies a brush to paint with [`app.useTool()`](https://github.com/aseprite/api/blob/master/api/app.md#appusetool)
  function.
**/
@:native( "_G.Brush" ) extern class Brush {

  var type( default, null ): Int;
  
  var size( default, null ): Int;
  
  var angle( default, null ): Int;
  
  var image( default, null ): Image;
  
  var center( default, null ): Point;
  
  var pattern( default, null ): Int;
  
  var patternOrigin( default, null ): Point;
  
  /**
    ```lua
    local brush = Brush()
    local brush = Brush(size)
    local brush = Brush(image)
    local brush = Brush{
      type=BrushType,
      size=integer,
      angle=-180...180,
      center=Point
      image=Image
      pattern=BrushPattern
      patternOrigin=Point
    }
    ```
    
    * [BrushType](https://github.com/aseprite/api/blob/master/api/brushtype.md#brushtype)
    * [BrushPattern](https://github.com/aseprite/api/blob/master/api/brushpattern.md#brushpattern)
    * [Image](https://github.com/aseprite/api/blob/master/api/image.md#image)
    * [Point](https://github.com/aseprite/api/blob/master/api/point.md#point)
  **/
  @:selfCall function new( options: { size: IntInput, type: BrushType, angle: IntInput, center: Point, image: Image, patter: BrushPattern, patternOrigin: Point } );
  
  function setFgColor( color: PixelColor ): Void;
  
  function setBgColor( color: PixelColor ): Void;

}
