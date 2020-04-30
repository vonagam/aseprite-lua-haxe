package aseprite;


@:native( "_G.Sprite" ) extern class Sprite {

  /*
    ```lua
    local name = sprite.filename
    sprite.filename = newName
    ```
    
    Gets or sets the name of the file from where this sprite was loaded or
    saved. Or an empty string if this is a new sprite without an
    associated file.
  */
  var filename: String;
  
  /*
    ```lua
    local w = sprite.width
    sprite.width = w
    ```
    
    Returns or changes the sprite width. Use
    [Sprite:resize](https://github.com/aseprite/api/blob/master/api/sprite.md#spriteresize) if you want to change the sprite size
    resizing layers, images, etc.
  */
  var width: Int;
  
  /*
    ```lua
    local h = sprite.height
    sprite.height = h
    ```
    
    Returns or changes the sprite height. Use
    [Sprite:resize](https://github.com/aseprite/api/blob/master/api/sprite.md#spriteresize) if you want to change the sprite size
    resizing layers, images, etc.
  */
  var height: Int;
  
  /*
    Returns the [color mode](https://github.com/aseprite/api/blob/master/api/colormode.md#colormode) of this sprite.
  */
  var colorMode( default, null ): ColorMode;
  
  var colorSpace: ColorSpace;
  
  /*
    ```lua
    local spec = sprite.spec
    ```
    
    The [specification](https://github.com/aseprite/api/blob/master/api/imagespec.md#imagespec) for image in this sprite.
  */
  var spec( default, null ): ImageSpec;
  
  /*
    ```lua
    local selection = sprite.selection
    sprite.selection = newSelection
    ```
    
    Gets or sets the active sprite selection. This property is an instance
    of the [Selection class](https://github.com/aseprite/api/blob/master/api/selection.md#selection) to manipulate the set of
    selected pixels in the canvas.
  */
  var selection: Selection;
  
  /*
    ```lua
    for i,frame in ipairs(s.frames) do
      -- ...
    end
    for i = 1,#s.frames do
      -- s.frames[i]
    end
    ```
    
    An array of [frames](https://github.com/aseprite/api/blob/master/api/frame.md#frame).
  */
  var frames( default, null ): Frames;
  
  /*
    An array of [palettes](https://github.com/aseprite/api/blob/master/api/palette.md#palette). Generally it contains only one
    palette (`sprite.palettes[1]`).
    
    In the future we'll support multiple palettes to create
    [color cycling animations](https://en.wikipedia.org/wiki/Color_cycling).
  */
  var palettes( default, null ): Palettes;
  
  /*
    ```lua
    for i,layer in ipairs(s.layers) do
      -- ...
    end
    for i = 1,#s.layers do
      -- s.layers[i]
    end
    ```
    
    An array of [layers](https://github.com/aseprite/api/blob/master/api/layer.md#layer).
  */
  var layers( default, null ): Layers;
  
  /*
    ```lua
    for i,cel in ipairs(s.cels) do
      -- ...
    end
    for i = 1,#s.cels do
      -- s.cels[i]
    end
    ```
    
    An array of [cels](https://github.com/aseprite/api/blob/master/api/cel.md#cel).
  */
  var cels( default, null ): Cels;
  
  /*
    ```lua
    for i,tag in ipairs(s.tags) do
      -- ...
    end
    for i = 1,#s.tags do
      -- s.tags[i]
    end
    ```
    
    An array of [tags](https://github.com/aseprite/api/blob/master/api/tag.md#tag).
  */
  var tags( default, null ): Tags;
  
  /*
    ```lua
    for i,slice in ipairs(s.slices) do
      -- ...
    end
    for i = 1,#s.slices do
      -- s.slices[i]
    end
    ```
    
    An array of [slices](https://github.com/aseprite/api/blob/master/api/slice.md#slice).
  */
  var slices( default, null ): Slices;
  
  /*
    Returns the [background
    layer](https://www.aseprite.org/docs/layers/#background-layer) a
    [layer](https://github.com/aseprite/api/blob/master/api/layer.md#layer) object or `nil` if the sprite doesn't contain a
    background layer.
  */
  var backgroundLayer( default, null ): Null< Layer >;
  
  /*
    ```lua
    local number = sprite.transparentColor
    sprite.transparentColor = number
    ```
    
    The transparent color is an intenger that specifies what index (`0` by
    default) is the transparent color in transparent layers on indexed
    sprites.
  */
  var transparentColor: Int;
  
  /*
    ```lua
    local rectangle = sprite.bounds
    ```
    
    Returns the bounds of the sprite as a
    [rectangle](https://github.com/aseprite/api/blob/master/api/rectangle.md#rectangle) in the position `0,0`.
    This is like calling `Rectangle{ x=0, y=0, width=sprite.width, height=sprite.height }`.
  */
  var bounds( default, null ): Rectangle;
  
  /*
    ```lua
    local rectangle = sprite.gridBounds
    sprite.gridBounds = rectangle
    ```
    
    Gets or sets the bounds of the sprite grid as a
    [rectangle](https://github.com/aseprite/api/blob/master/api/rectangle.md#rectangle).
  */
  var gridBounds: Rectangle;
  
  /*
    ```lua
    local sprite = Sprite(width, height)
    local sprite = Sprite(width, height, colorMode)
    local sprite = Sprite(spec)
    local sprite = Sprite(otherSprite)
    local sprite = Sprite{ fromFile=filename }
    ```
    
    Creates a new sprite with the given `width` and `height`. The
    [color mode](https://github.com/aseprite/api/blob/master/api/colormode.md#colormode) is optional, [RGB](https://github.com/aseprite/api/blob/master/api/colormode.md#colormodergb)
    by default.
    
    The `spec` parameter is an [image specification](https://github.com/aseprite/api/blob/master/api/imagespec.md#imagespec) object.
    
    If `otherSprite` is given (other `Sprite` object), the sprite is duplicated.
    
    If `fromFile` is given, it indicates a file name (a string) and it's
    like opening a new document with [`app.open()`](https://github.com/aseprite/api/blob/master/api/app.md#appopen).
  */
  @:overload( function( width: Int, height: Int, ?colorMode: ColorMode ): Void {})
  @:selfCall function new( options: EitherType4< Sprite, ImageSpec, { fromFile: String }, { width: Int, height: Int, ?colorMode: ColorMode, } > );
  
  /*
    ```lua
    sprite:resize(width, height)
    sprite:resize(size)
    ```
    
    Resize the sprite (and all frames/cels) to the given dimensions. See
    [Size class](https://github.com/aseprite/api/blob/master/api/size.md#size).
  */
  function resize( size: SizeInput ): Void;
  
  /*
    ```lua
    sprite:crop(x, y, width, height)
    sprite:crop(rectangle)
    ```
    
    Crops the sprite to the given dimensions. See the
    [Rectangle class](https://github.com/aseprite/api/blob/master/api/rectangle.md#rectangle).
  */
  function crop( ?rectangle: RectangleInput ): Void;
  
  /*
    ```lua
    sprite:saveAs(filename)
    ```
    
    Saves the sprite to the given file and mark the sprite as saved so
    closing it doesn't will ask to save changes.
  */
  function saveAs( filename: String ): Bool;
  
  /*
    ```lua
    sprite:saveCopyAs(filename)
    ```
    
    Saves a copy of the sprite in the given file but doesn't change the
    saved state of the sprite, if the sprite is modified and then try to
    close it, the user will be asked to save changes.
  */
  function saveCopyAs( filename: String ): Bool;
  
  /*
    ```lua
    sprite:close()
    ```
    
    Closes the sprite. This doesn't ask the user to save changes. If you
    want to do the classic *File > Close* where the user is asking to save
    changes, you can use `app.command.CloseFile()`.
  */
  function close(): Void;
  
  /*
    ```lua
    sprite:loadPalette(filename)
    ```
    
    Sets the sprite palette loading it from the given file.
    
    The same can be achieved using [`Palette{ fromFile }`](https://github.com/aseprite/api/blob/master/api/palette.md#palette):
    
    ```lua
    sprite:setPalette(Palette{ fromFile=filename })
    ```
  */
  function loadPalette( filename: String ): Void;
  
  /*
    ```lua
    sprite:setPalette(palette)
    ```
    
    Changes the sprite [palette](https://github.com/aseprite/api/blob/master/api/palette.md#palette).
  */
  function setPalette( palette: Palette ): Void;
  
  function assignColorSpace( colorSpace: ColorSpace ): Void;
  
  function convertColorSpace( colorSpace: ColorSpace ): Void;
  
  /*
    ```lua
    sprite:flatten()
    ```
    
    Flatten all layers of the sprite into one layer.
    It's like calling `app.commands.FlattenLayers()`.
  */
  function flatten(): Void;
  
  /*
    ```lua
    local layer = sprite:newLayer()
    ```
    
    Creates a new [layer](https://github.com/aseprite/api/blob/master/api/layer.md#layer) at the top of the layers stack.
  */
  function newLayer(): Layer;
  
  /*
    ```lua
    local layerGroup = sprite:newGroup()
    ```
    
    Creates a new empty [layer group](https://github.com/aseprite/api/blob/master/api/layer.md#layer) at the top of the layers stack.
  */
  function newGroup(): Layer;
  
  /*
    ```lua
    sprite:deleteLayer(layer)
    sprite:deleteLayer(layerName)
    ```
    
    Deletes the given [layer](https://github.com/aseprite/api/blob/master/api/layer.md#layer) or the layer with the given `layerName` (a string).
  */
  function deleteLayer( layer: EitherType2< Layer, String > ): Void;
  
  /*
    ```lua
    local frame = sprite:newFrame(frame)
    local frame = sprite:newFrame(frameNumber)
    ```
    
    Creates a copy of the given [frame](https://github.com/aseprite/api/blob/master/api/frame.md#frame) object or frame number
    and returns a [`Frame`](https://github.com/aseprite/api/blob/master/api/frame.md#frame) that points to the newly created
    frame in `frameNumber` position.
  */
  function newFrame( ?frame: FrameNumberInput ): Frame;
  
  /*
    Creates a new empty frame in the given `frameNumber` (an integer) and
    returns the new [frame](https://github.com/aseprite/api/blob/master/api/frame.md#frame).
  */
  function newEmptyFrame( ?frame: FrameNumberInput ): Frame;
  
  /*
    ```lua
    sprite:deleteFrame(frame)
    ```
  */
  function deleteFrame( frame: FrameNumberInput ): Void;
  
  /*
    ```lua
    cel = sprite:newCel(layer, frame)
    cel = sprite:newCel(layer, frame, image, position)
    ```
    
    Creates a new [cel](https://github.com/aseprite/api/blob/master/api/cel.md#cel) in the given [layer](https://github.com/aseprite/api/blob/master/api/layer.md#layer) and `frame`
    number. If the [image](https://github.com/aseprite/api/blob/master/api/image.md#image) is not specified, a new image will be
    created with the size of the sprite canvas. The [position](https://github.com/aseprite/api/blob/master/api/point.md#point)
    is a point to locate the image.
  */
  function newCel( layer: Layer, frame: FrameNumberInput, ?image: Image, ?position: PointInput ): Cel;
  
  /*
    ```lua
    sprite:deleteCel(cel)
    sprite:deleteCel(layer, frame)
    ```
    
    Deletes the given [cel](https://github.com/aseprite/api/blob/master/api/cel.md#cel). If the cel is from a transparent
    layer, the cel is completely deleted, but if the cel is from a
    background layer, the cel will be delete with the
    [background color](https://github.com/aseprite/api/blob/master/api/app.md#appbgcolor).
  */
  @:overload( function( layer: Layer, frame: FrameNumberInput ): Void {})
  function deleteCel( cel: Cel ): Void;
  
  /*
    ```lua
    local tag = sprite:newTag(fromFrameNumber, toFrameNumber)
    ```
    
    Creates a new [tag](https://github.com/aseprite/api/blob/master/api/tag.md#tag) in the given frame range and with the given name.
  */
  function newTag( from: FrameNumberInput, to: FrameNumberInput ): Tag;
  
  /*
    ```lua
    sprite:deleteTag(tag)
    sprite:deleteTag(tagName)
    ```
    
    Deletes the given [tag](https://github.com/aseprite/api/blob/master/api/tag.md#tag).
  */
  function deleteTag( tag: EitherType2< Tag, String > ): Void;
  
  /*
    ```lua
    local slice = sprite:newSlice()
    local slice = sprite:newSlice(Rectangle)
    ```
    
    Returns a new [slice](https://github.com/aseprite/api/blob/master/api/slice.md#slice).
  */
  function newSlice( ?rectangle: RectangleInput ): Slice;
  
  /*
    ```lua
    sprite:deleteSlice(slice)
    sprite:deleteSlice(sliceName)
    ```
    
    Deletes the given [slice](https://github.com/aseprite/api/blob/master/api/slice.md#slice).
  */
  function deleteSlice( slice: EitherType2< Slice, String > ): Void;

}
