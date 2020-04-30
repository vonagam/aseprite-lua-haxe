package aseprite;


@:forward extern abstract Palette( PaletteData ) {

  /*
    ```lua
    local palette = Palette()
    local palette = Palette(numberOfColors)
    local palette = Palette(otherPalette)
    local palette = Palette{ fromFile=filename }
    local palette = Palette{ fromResource=resourceID }
    ```
    
    Creates a new palette. By default it will contain 256 colors, but you
    can specify a `numberOfColors` (integer value).
    
    `otherPalette` can be another palette object to create a copy of it.
    
    If `fromFile` is given, the palette is loaded from the file name.
    
    If `fromResource` is given, the `resourceID` is an ID specified in one
    of the [extensions
    palette](https://github.com/aseprite/aseprite/tree/master/data/extensions)
    (e.g.
    [`DB16`](https://github.com/aseprite/aseprite/blob/8e193b592ae06abb36be6f72ef43c308b511b24c/data/extensions/dawnbringer-palettes/package.json#L13),
    [`DB32`](https://github.com/aseprite/aseprite/blob/8e193b592ae06abb36be6f72ef43c308b511b24c/data/extensions/dawnbringer-palettes/package.json#L14),
    [`Solarized`](https://github.com/aseprite/aseprite/blob/8e193b592ae06abb36be6f72ef43c308b511b24c/data/extensions/software-palettes/package.json#L15)).
  */
  inline function new( options: EitherType4< Palette, Int, { fromFile: String }, { fromResource: String } > ) {
    this = new PaletteData( options );
  }
  
  var length( get, never ): Int;
  
  private inline function get_length(): Int {
    return untyped __lua__( "#{0}", this );
  }

}

@:native( "_G.Palette" ) extern class PaletteData {

  /*
    At the moment it always return the first [frame](https://github.com/aseprite/api/blob/master/api/frame.md#frame), but in a
    near future Aseprite will support palette changes over time (in
    different frames), so this field should be the frame number where this
    palette is displayed for first time in the [sprite](https://github.com/aseprite/api/blob/master/api/sprite.md#sprite).
  */
  var frame( default, null ): Frame;
  
  var frameNumber( default, null ): LuaIndex;
  
  /*
    ```lua
    local palette = Palette()
    local palette = Palette(numberOfColors)
    local palette = Palette(otherPalette)
    local palette = Palette{ fromFile=filename }
    local palette = Palette{ fromResource=resourceID }
    ```
    
    Creates a new palette. By default it will contain 256 colors, but you
    can specify a `numberOfColors` (integer value).
    
    `otherPalette` can be another palette object to create a copy of it.
    
    If `fromFile` is given, the palette is loaded from the file name.
    
    If `fromResource` is given, the `resourceID` is an ID specified in one
    of the [extensions
    palette](https://github.com/aseprite/aseprite/tree/master/data/extensions)
    (e.g.
    [`DB16`](https://github.com/aseprite/aseprite/blob/8e193b592ae06abb36be6f72ef43c308b511b24c/data/extensions/dawnbringer-palettes/package.json#L13),
    [`DB32`](https://github.com/aseprite/aseprite/blob/8e193b592ae06abb36be6f72ef43c308b511b24c/data/extensions/dawnbringer-palettes/package.json#L14),
    [`Solarized`](https://github.com/aseprite/aseprite/blob/8e193b592ae06abb36be6f72ef43c308b511b24c/data/extensions/software-palettes/package.json#L15)).
  */
  @:selfCall function new( options: EitherType4< Palette, Int, { fromFile: String }, { fromResource: String } > );
  
  /*
    ```lua
    palette:resize(ncolors)
    ```
    
    Changes the number of the palette colors to `ncolors` (an integer
    value).
  */
  function resize( size: Int ): Void;
  
  /*
    ```lua
    local color = palette:getColor(index)
    ```
    
    Returns the [`color`](https://github.com/aseprite/api/blob/master/api/color.md#color) in the given entry `index` (the `index` goes from `0` to `#palette-1`).
  */
  function getColor( index: Int ): Color;
  
  /*
    ```lua
    palette:setColor(index, color)
    ```
    
    Changes a palette color in the given entry `index` (the `index` goes from `0` to `#palette-1`).
    The `color` can be a [`Color`](https://github.com/aseprite/api/blob/master/api/color.md#color) object or an [integer pixel value](https://github.com/aseprite/api/blob/master/api/pixelcolor.md#apppixelcolor).
  */
  function setColor( index: Int, color: AnyColorInput ): Void;
  
  /*
    ```lua
    palette:saveAs(filename)
    ```
    
    Saves the palette in the given `filename`.
  */
  function saveAs( filename: String ): Void;

}
