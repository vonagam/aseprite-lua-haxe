package aseprite;


/*
  An image object. Each [cel](https://www.aseprite.org/docs/cel/) has
  one image (all [linked cels](https://www.aseprite.org/docs/linked-cels/)
  share the same image).
  
  An image can be associated to a specific cel or can be alone:
  
  * When you create an image with `Image()`, the image will be alone so
    they don't generate undo information.
  * A [Cel.image](https://github.com/aseprite/api/blob/master/api/cel.md#celimage) is an image associated to a cel, some
    functions will generate undoable actions.
*/
@:native( "_G.Image" ) extern class Image {

  /*
    ```lua
    local w = image.width
    ```
  */
  var width( default, null ): Int;
  
  /*
    ```lua
    local h = image.height
    ```
  */
  var height( default, null ): Int;
  
  /*
    ```lua
    local colorMode = image.colorMode
    ```
    
    Image [color mode](https://github.com/aseprite/api/blob/master/api/colormode.md#colormode).
  */
  var colorMode( default, null ): ColorMode;
  
  /*
    ```lua
    local spec = image.spec
    ```
    
    The [specification](https://github.com/aseprite/api/blob/master/api/imagespec.md#imagespec) for this image.
  */
  var spec( default, null ): ImageSpec;
  
  /*
    ```lua
    local cel = image.cel
    ```
    
    Returns the [cel](https://github.com/aseprite/api/blob/master/api/cel.md#cel) to which this image belongs or `nil` if this
    image is not associated to a cel.
  */
  var cel( default, null ): Cel;
  
  /*
    ```lua
    local image = Image(width, height [, colorMode])
    local image = Image(spec)
    local image = Image(sprite)
    local image = Image(otherImage)
    local image = Image{ fromFile=filename }
    ```
    
    Creates a new image with the given `width` and `height`. The
    [color mode](https://github.com/aseprite/api/blob/master/api/colormode.md#colormode) is optional, [RGB](https://github.com/aseprite/api/blob/master/api/colormode.md#colormodergb)
    by default.
    
    The `spec` parameter is an [image specification](https://github.com/aseprite/api/blob/master/api/imagespec.md#imagespec) object.
    
    If you specify `otherImage`, it's equivalent to use
    [`otherImage:clone()`](https://github.com/aseprite/api/blob/master/api/image.md#imageclone).
    
    If a `sprite` is given, the image will be a render of the first frame
    of the [sprite](https://github.com/aseprite/api/blob/master/api/sprite.md#sprite). Note: You can use
    [`Image:drawSprite()`](https://github.com/aseprite/api/blob/master/api/image.md#imagedrawsprite) to draw other frame.
    
    If `fromFile` is given, it indicates a file name (a string) and
    it will create an image loading the first frame of the given file.
  */
  @:overload( function( width: Int, height: Int, ?colorMode: ColorMode ): Void {})
  @:selfCall function new( options: EitherType5< Image, ImageSpec, Sprite, { fromFile: String }, { width: Int, height: Int, colorMode: ColorMode, } > );
  
  /*
    ```lua
    local copy = image:clone()
    ```
    
    Creates a copy of the given image. You can use the `Image(otherImage)`
    constructor for the same behavior.
    
    he new image is unrelated to the sprite, but can be used to update the
    image in a transaction. E.g. You clone an image, modify the pixels
    from the copy, and then you [patch the image](https://github.com/aseprite/api/blob/master/api/image.md#imageputimage).
  */
  function clone(): Image;
  
  /*
    ```lua
    image:clear([ color ])
    ```
    
    Clear all pixels in the image with the given [color](https://github.com/aseprite/api/blob/master/api/color.md#color) (or
    `image.spec.transparentColor` if no color is specified).
  */
  function clear( ?color: AnyColorInput ): Void;
  
  /*
    ```lua
    local pixelValue = image:getPixel(x, y)
    ```
    
    Returns a [integer pixel value](https://github.com/aseprite/api/blob/master/api/pixelcolor.md#apppixelcolor) for the given
    *xy*-coordinate related to the "Image" itself. The returned value will
    depend on the [color mode](https://github.com/aseprite/api/blob/master/api/image.md#imagecolormode) of the image.
    
    Do NOT confuse with the absolute *xy*-coordinate in the Canvas.
    In the following example, we show the differences between `getPixel()`,
    [`Cel.bounds`](https://github.com/aseprite/api/blob/master/api/cel.md#celbounds) and [`Cel.position`](https://github.com/aseprite/api/blob/master/api/cel.md#celposition):
    
    ![Coordinates example for getPixel](https://github.com/aseprite/api/blob/master/api/image/getpixel.gif)
  */
  function getPixel( x: IntInput, y: IntInput ): PixelColor;
  
  /*
    ```lua
    image:drawPixel(x, y, color)
    ```
    
    Sets the pixel in the *xy*-coordinate to the given [integer pixel
    value](pixelcolor.md#apppixelcolor). The *xy*-coordinate is relative to the image,
    so pixel (0, 0) is the first pixel at the top-left coorner in the
    image, not in the sprite canvas.
    
    **Warning**: This method doesn't create undo information, you should
    [clone the image](https://github.com/aseprite/api/blob/master/api/image.md#imageclone) and then [patch it](https://github.com/aseprite/api/blob/master/api/image.md#imageputimage) to
    get proper undo/redo information.
  */
  function drawPixel( x: IntInput, y: IntInput, color: PixelColor ): Void;
  
  /*
    ```lua
    destinationImage:drawImage(sourceImage [, position ] )
    ```
    
    Copies/draws the given *sourceImage* image over *destinationImage*.
    If *position* is a [point](https://github.com/aseprite/api/blob/master/api/point.md#point), it will draw the *sourceImage*
    in the given position.
    
    **Warning**: If the image is associated with a [Cel](https://github.com/aseprite/api/blob/master/api/cel.md#cel), this
    method generates undo information, so you could use it as an
    individual operation or in a [transaction](https://github.com/aseprite/api/blob/master/api/app.md#apptransaction).
  */
  function drawImage( image: Image, ?position: PointInput ): Void;
  
  /*
    ```lua
    destinationImage:drawSprite(sourceSprite, frameNumber, [, position ] )
    ```
    
    Draws the given [sourceSprite](https://github.com/aseprite/api/blob/master/api/sprite.md#sprite) frame number into the
    *destinationImage*. If *position* is a [point](https://github.com/aseprite/api/blob/master/api/point.md#point), it will draw
    the *sourceSprite* in the given position.
    
    **Warning**: If the image is associated with a [Cel](https://github.com/aseprite/api/blob/master/api/cel.md#cel), this
    method generates undo information, so you could use it as an
    individual operation or in a [transaction](https://github.com/aseprite/api/blob/master/api/app.md#apptransaction).
  */
  function drawSprite( sprite: Sprite, frame: FrameNumberInput, ?position: PointInput ): Void;
  
  /*
    ```lua
    iterator = image:pixels()
    iterator = image:pixels(rectangle)
    ```
    
    Returns a pixel iterator for the whole image or the given
    [rectangle](https://github.com/aseprite/api/blob/master/api/rectangle.md#rectangle). Then you can use the iterator to read or
    change pixel values in this way:
    
    ```lua
    for it in image:pixels() do
      local pixelValue = it() -- get pixel
      it(pixelValue)          -- set pixel
      print(it.x, it.y)       -- get pixel x,y coordinates
    end
    ```
    
    A `pixelValue!` can be interpreted with the
    [app.pixelColor](https://github.com/aseprite/api/blob/master/api/pixelcolor.md#apppixelcolor) functions.
  */
  function pixels( ?rectangle: Rectangle ): lua.NativeIterator< ImageIteratorObject >;
  
  /*
    ```lua
    if imageA:isEqual(imageB) then
      print("Both images are equal")
    end
    ```
    
    Returns true if both images looks the same ([spec](https://github.com/aseprite/api/blob/master/api/image.md#imagespec) is
    equal and all [pixels](https://github.com/aseprite/api/blob/master/api/image.md#imagepixels) are the same).
  */
  function isEqual( image: Image ): Bool;
  
  /*
    ```lua
    local result = image:isEmpty()
    ```
    
    Returns true if all pixels in the image are equal to the transparent
    color.
  */
  function isEmpty(): Bool;
  
  /*
    ```lua
    local result = image:isPlain(color)
    ```
    
    Returns true if all pixels in the image are equal to the given `color`
    (which can be a [pixel color](https://github.com/aseprite/api/blob/master/api/pixelcolor.md#apppixelcolor) or a
    [color](https://github.com/aseprite/api/blob/master/api/color.md#color)).
  */
  function isPlain( color: AnyColorInput ): Bool;
  
  /*
    ```lua
    image:saveAs(filename)
    image:saveAs{ filename=string,
                  palette=Palette }
    ```
    
    Saves the image as a sprite in the given `filename`.
    
    To save an [indexed image](https://github.com/aseprite/api/blob/master/api/colormode.md#colormodeindexed) we need to
    specify a `palette` parameter (a [Palette](https://github.com/aseprite/api/blob/master/api/palette.md#palette)
    object).  If we don't specify a palette parameter, in case that the
    image is related to a [Cel](https://github.com/aseprite/api/blob/master/api/cel.md#cel), we'll use the palette of the
    Cel's [Sprite](https://github.com/aseprite/api/blob/master/api/sprite.md#sprite).
  */
  function saveAs( options: EitherType2< String, { filename: String, ?palette: Palette } > ): Bool;
  
  /*
    ```lua
    image:resize(width, height)
    image:resize{ width=integer, height=integer, ... }
    image:resize{ size=Size(width, height), ... }
    image:resize{ ..., method='bilinear' | 'rotsprite' }
    image:resize{ ..., pivot=Point(x, y) }
    ```
    
    Resizes the image. The pivot is `Point(0, 0)` by default (i.e.  the
    image right and bottom sides will be increased, and the top-left
    corner will be in the same place).
  */
  function resize( options: { ?width: Int, ?height: Int, ?size: SizeInput, ?method: String, ?pivot: PointInput } ): Void;

}
