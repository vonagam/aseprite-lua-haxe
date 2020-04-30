package aseprite;


extern class Layer {

  /*
    Gets the sprite to which this layer belongs.
  */
  var sprite( default, null ): Sprite;
  
  /*
    ```lua
    local spriteOrLayerGroup = layer.parent
    layer.parent = sprite
    layer.parent = group
    ```
    
    Gets the sprite or the layer group which this layer belongs. You can
    also sets the parent to move the layer at the top of the stack of that
    parent.
  */
  var parent: EitherType2< Sprite, Layer >;
  
  /*
    It's a table of sub-layers if this layer is a group
    ([`Layer.isGroup`](https://github.com/aseprite/api/blob/master/api/layer.md#layerisgroup)), or nil if this is not a group.
  */
  var layers( default, null ): Layers;
  
  /*
    ```lua
    local index = layer.stackIndex
    layer.stackIndex = newPosition
    ```
    
    Gets or sets the position of this layer in the stack (i.e. the index
    in the `layer.parent.layers` table). `1` means the first layer (the
    [background layer](https://www.aseprite.org/docs/layers/#background-layer)),
    and bigger numbers layers that are above.
  */
  var stackIndex: LuaIndex;
  
  var previous( default, null ): Layer;
  
  var next( default, null ): Layer;
  
  /*
    Gets/sets the layer name (a string).
  */
  var name: String;
  
  /*
    ```lua
    local opacity = layer.opacity
    layer.opacity = newOpacity
    ```
    
    Gets or sets the cel opacity. A value from `0` to `255` (which means
    `0=0%` completely transparent, or `255=100%` completely opaque).
  */
  var opacity: Int;
  
  /*
    ```lua
    local blendMode = layer.blendMode
    layer.blendMode = newBlendMode
    ```
    
    Gets or sets the layer blending mode. Check the possible
    [BlendMode](https://github.com/aseprite/api/blob/master/api/blendmode.md#blendmode) values.
  */
  var blendMode: BlendMode;
  
  /*
    It's true if this layer has [cels](https://github.com/aseprite/api/blob/master/api/cel.md#cel) with [images](https://github.com/aseprite/api/blob/master/api/image.md#image).
  */
  var isImage( default, null ): Bool;
  
  /*
    It's true if this layer has sublayers inside.
  */
  var isGroup( default, null ): Bool;
  
  /*
    It's true if this layer is a [transparent layer](https://www.aseprite.org/docs/layers/#transparent-layers)
    (instead of a the [background layer](https://github.com/aseprite/api/blob/master/api/layer.md#layerisbackground)). Transparent layers have
    an alpha channel or, for [indexed color mode](https://github.com/aseprite/api/blob/master/api/colormode.md#colormodeindexed),
    the [transparent index](https://www.aseprite.org/docs/transparent-color/) is not visible.
  */
  var isTransparent( default, null ): Bool;
  
  /*
    It's true if this layer is the [background layer](https://www.aseprite.org/docs/layers/#background-layer).
    A background layer is opaque, doesn't have alpha channel (`Alpha=255` on every pixel),
    or in [indexed color mode](https://github.com/aseprite/api/blob/master/api/colormode.md#colormodeindexed), the
    [transparent index](https://www.aseprite.org/docs/transparent-color/) is ignored.
  */
  var isBackground( default, null ): Bool;
  
  var isEditable: Bool;
  
  var isVisible: Bool;
  
  var isContinuous: Bool;
  
  var isCollapsed: Bool;
  
  var isExpanded: Bool;
  
  /*
    Returns the collection of [cels](https://github.com/aseprite/api/blob/master/api/cel.md#cel) of this layer. Empty if the
    layer is a group.
    
    See also the [Layer:cel()](https://github.com/aseprite/api/blob/master/api/layer.md#layercel) function.
  */
  var cels( default, null ): Cels;
  
  /*
    ```lua
    local color = layer.color
    layer.color = color
    ```
    
    Gets or sets the user-defined [color](https://github.com/aseprite/api/blob/master/api/color.md#color) of this layer in the timeline.
  */
  var color: Color;
  
  /*
    ```lua
    local data = layer.data
    layer.data = data
    ```
    
    Gets or sets the user-defined data related to this layer (a text string).
  */
  var data: String;
  
  /*
    ```lua
    local cel = layer:cel(frameNumber)
    assert(cel == layer:cel(sprite.frames[frameNumber]))
    ```
    
    Returns the [Cel](https://github.com/aseprite/api/blob/master/api/cel.md#cel) in the given [frame](https://github.com/aseprite/api/blob/master/api/frame.md#frame) or
    `frameNumber` (an integer). Returns `nil` if there is no cel in the layer/frame.
  */
  function cel( frame: FrameNumberInput ): Null< Cel >;

}
