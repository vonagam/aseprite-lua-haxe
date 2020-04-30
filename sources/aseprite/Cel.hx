package aseprite;


/*
  A [cel](https://www.aseprite.org/docs/cel/) is an [image](https://github.com/aseprite/api/blob/master/api/cel.md#celimage) in a specific
  [*xy*-coordinate](https://github.com/aseprite/api/blob/master/api/cel.md#celposition), and a specific
  [layer](https://github.com/aseprite/api/blob/master/api/cel.md#cellayer)/[frame](https://github.com/aseprite/api/blob/master/api/cel.md#celframe) combination.
*/
extern class Cel {

  /*
    ```lua
    local sprite = cel.sprite
    ```
    
    Cels belong to one [sprite](https://github.com/aseprite/api/blob/master/api/sprite.md#sprite). This property returns that sprite.
  */
  var sprite( default, null ): Sprite;
  
  /*
    ```lua
    local layer = cel.layer
    ```
    
    Returns the [layer](https://github.com/aseprite/api/blob/master/api/layer.md#layer) where this cel is located.
  */
  var layer( default, null ): Layer;
  
  /*
    ```lua
    local frame = cel.frame
    ```
    
    Returns the [frame](https://github.com/aseprite/api/blob/master/api/frame.md#frame) object which this cel belongs.
  */
  var frame( default, null ): Frame;
  
  /*
    ```lua
    local frameNumber = cel.frameNumber
    ```
    
    Returns the frame number which this cel belongs, the frame number `1`
    is the first frame (not `0`).
  */
  var frameNumber( default, null ): LuaIndex;
  
  /*
    ```lua
    local image = cel.image
    cel.image = newImage
    ```
    
    Gets or sets the [image](https://github.com/aseprite/api/blob/master/api/image.md#image) with the pixels of this cel. This
    is the preferred way to replace the cel image, because it generates
    only one undoable action.
  */
  var image: Image;
  
  /*
    ```lua
    local bounds = cel.bounds
    ```
    
    Returns the [rectangle](https://github.com/aseprite/api/blob/master/api/rectangle.md#rectangle) with the cel bounds (position
    and size).
  */
  var bounds( default, null ): Rectangle;
  
  /*
    ```lua
    local position = cel.position
    cel.position = newPosition
    ```
    
    Gets or sets the cel position.
  */
  var position: Point;
  
  /*
    ```lua
    local opacity = cel.opacity
    cel.opacity = newOpacity
    ```
    
    Gets or sets the cel opacity. A value from `0` to `255` (which means
    `0=0%` completely transparent, or `255=100%` completely opaque).
  */
  var opacity: Int;
  
  /*
    ```lua
    local color = cel.color
    cel.color = newColor
    ```
    
    Gets or sets the user-defined [color](https://github.com/aseprite/api/blob/master/api/color.md#color) of this cel in the timeline.
  */
  var color: Color;
  
  /*
    ```lua
    local data = cel.data
    cel.data = newData
    ```
    
    Gets or sets the user-defined data related to this cel (a text string).
  */
  var data: String;

}
