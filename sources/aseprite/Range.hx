package aseprite;


/**
  This class is used to represent the range of selected objects.
  
  For example:
  
  ![Timeline Example](https://github.com/aseprite/api/blob/master/api/rangetype/cels.png)
  
  It can be:
  
  * A list of layers
  * A list of frames
  * A list of cels
  * A list of images
  * A list of colors
  
  Or a combination of those.
**/
extern class Range {

  /**
    [Sprite](https://github.com/aseprite/api/blob/master/api/sprite.md#sprite) to which this range is pointing to.
  **/
  var sprite( default, null ): Sprite;
  
  /**
    ```lua
    local type = app.range.type
    ```
    
    Returns a [RangeType](https://github.com/aseprite/api/blob/master/api/rangetype.md#rangetype).
  **/
  var type( default, null ): RangeType;
  
  /**
    ```lua
    local booleanResult = app.range.isEmpty
    ```
    
    Returns true if the range is empty, i.e. there is no selected range in
    the timeline (a thick border in the timeline), only the [active cel](https://github.com/aseprite/api/blob/master/api/app.md#appactivecel)
    in the sprite editor.
    
    This is the same as asking for `app.range.type == RangeType.EMPTY`.
    
    Note that if the range is empty, you can still use
    [Range.layers](https://github.com/aseprite/api/blob/master/api/range.md#rangelayers) to get the [active
    layer](app.md#appactivelayer) (the Range.layers property will be an
    array of one element, just the active layer). The same is true for
    [Range.frame](https://github.com/aseprite/api/blob/master/api/range.md#rangeframes) and
    [app.activeFrame](https://github.com/aseprite/api/blob/master/api/app.md#appactiveframe),
    [Range.cel](https://github.com/aseprite/api/blob/master/api/range.md#rangecels) and
    [app.activeCel](https://github.com/aseprite/api/blob/master/api/app.md#appactivecel), etc.
  **/
  var isEmpty( default, null ): Bool;
  
  /**
    ``lua
    local layers = app.range.layers
    app.range.layers = { layer1, layer2, ... }
    ``
    
    Returns or sets the array of selected [layers](https://github.com/aseprite/api/blob/master/api/layer.md#layer).
  **/
  var layers: Layers;
  
  /**
    ``lua
    local frames = app.range.frames
    app.range.frames = { 1, 2, ... }
    ``
    
    Returns or sets the array of selected [frames](https://github.com/aseprite/api/blob/master/api/frame.md#frame).
  **/
  var frames: Frames;
  
  /**
    Returns an array of selected [cels](https://github.com/aseprite/api/blob/master/api/cel.md#cel).
  **/
  var cels( default, null ): Cels;
  
  /**
    Returns an array of selected [images](https://github.com/aseprite/api/blob/master/api/image.md#image) (images from linked
    cels are counted just one time in this array).
  **/
  var images( default, null ): Images;
  
  /**
    Returns an array of selected [images](https://github.com/aseprite/api/blob/master/api/image.md#image) in the range that are
    in unlocked layers (editable).
  **/
  var editableImages( default, null ): Images;
  
  /**
    ```lua
    local selectedColors = app.range.colors
    app.range.colors = { ... }
    ```
    
    Gets or sets the array of selected palette entries in the [color bar](https://www.aseprite.org/docs/color-bar/).
    Each element of the array is an integer (the palette index)
    
    Example to select the colors with index 0 and 3 in the color bar:
    ```lua
    app.range.colors = { 0, 3 }
    ```
  **/
  var colors: LuaArray< Int >;
  
  /**
    ```lua
    local hasLayer = app.range:contains(layer)
    local hasFrame = app.range:contains(frame)
    local hasCel = app.range:contains(cel)
    ```
    
    Returns true if the given object
    ([layer](https://github.com/aseprite/api/blob/master/api/layer.md#layer)/[frame](https://github.com/aseprite/api/blob/master/api/frame.md#frame)/[cel](https://github.com/aseprite/api/blob/master/api/cel.md#cel)) is
    inside the selected range.
  **/
  function contains( object: EitherType4< Layer, Cel, Frame, Int > ): Bool;
  
  /**
    ```lua
    local hasColor = app.range:containsColor(colorIndex)
    ```
    
    Returns true if the given color index is selected in the [color bar](https://www.aseprite.org/docs/color-bar/).
  **/
  function containsColor( index: Int ): Bool;
  
  /**
    ```lua
    app.range:clear()
    ```
    
    Clears the current selected range of frames/layers/cels/colors.
  **/
  function clear(): Void;

}
