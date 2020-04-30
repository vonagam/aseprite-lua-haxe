package aseprite;


/*
  The `app` global namespace.
*/
extern class App {

  /*
    ```lua
    local sprite = app.activeSprite
    ```
    
    Returns the active sprite, a [Sprite](https://github.com/aseprite/api/blob/master/api/sprite.md#sprite) object.
  */
  var activeSprite: Sprite;
  
  /*
    Returns the active layer, a [Layer](https://github.com/aseprite/api/blob/master/api/layer.md#layer) object.
  */
  var activeLayer: Layer;
  
  /*
    Gets or sets the active frame number (1 is the first frame in the sprite).
    
    **WARNING**: This function has a bug in Aseprite v1.2.10-beta2,
    returns `nil` if we are in the first frame of the sprite. Also it
    returns a number, but in the future it will returns a
    [frame](https://github.com/aseprite/api/blob/master/api/frame.md#frame) object, you can use an auxiliary function at the
    moment:
    
    ```lua
    local function activeFrameNumber()
      local f = app.activeFrame
      if f == nil then
        return 1
      else
        return f
      end
    end
    ```
  */
  var activeFrame: Frame;
  
  /*
    Gets or sets the active [Cel](https://github.com/aseprite/api/blob/master/api/cel.md#cel) object.
  */
  var activeCel: Cel;
  
  /*
    ```lua
    local image = app.activeImage
    ```
    
    Returns the active image, an [Image](https://github.com/aseprite/api/blob/master/api/image.md#image) object.
  */
  var activeImage: Image;
  
  /*
    Returns the active [tag](https://github.com/aseprite/api/blob/master/api/tag.md#tag), which is the tag located at the
    [active frame](https://github.com/aseprite/api/blob/master/api/app.md#appactiveframe).
  */
  var activeTag( default, null ): Tag;
  
  /*
    Returns the active tool (a [Tool](https://github.com/aseprite/api/blob/master/api/tool.md#tool) object) selected in
    the [tool bar](https://www.aseprite.org/docs/workspace/).
  */
  var activeTool: Tool;
  
  /*
    Returns the active brush (a [Brush](https://github.com/aseprite/api/blob/master/api/brush.md#brush) object) selected
    in the [context bar](https://www.aseprite.org/docs/workspace/).
  */
  var activeBrush: Brush;
  
  /*
    ```lua
    for i,sprite in ipairs(app.sprites) do
      -- do something with each sprite...
    end
    ```
    
    Returns an array of [sprites](https://github.com/aseprite/api/blob/master/api/sprite.md#sprite).
  */
  var sprites( default, null ): Sprites;
  
  /*
    Gets or sets the current foreground [color](https://github.com/aseprite/api/blob/master/api/color.md#color).
  */
  var fgColor: Color;
  
  /*
    Gets or sets the current background [color](https://github.com/aseprite/api/blob/master/api/color.md#color). Remember that
    some commands use the background color to clear the active layer.
  */
  var bgColor: Color;
  
  /*
    Returns the Aseprite version number as a [`Version`](https://github.com/aseprite/api/blob/master/api/version.md#version) object (e.g. `Version("1.2.10-beta1")`).
  */
  var version( default, null ): Version;
  
  /*
    Returns the API version. See the [changes file](https://github.com/aseprite/api/blob/master/api/../Changes.md#api-changes) between
    version to know what offer each API version.
  */
  var apiVersion( default, null ): Int;
  
  /*
    Active [site](https://github.com/aseprite/api/blob/master/api/site.md#site) (active image, layer, frame, sprite, etc.).
  */
  var site( default, null ): Site;
  
  /*
    [Range](https://github.com/aseprite/api/blob/master/api/range.md#range) member represents the active selection from an objects collection. It returns a sorted list of selected frames, or cels, or layers, or colors, etc.
  */
  var range( default, null ): Range;
  
  /*
    Returns true if the UI is available. E.g. if this is true you can use
    [app.alert](https://github.com/aseprite/api/blob/master/api/app.md#appalert) or [dialogs](https://github.com/aseprite/api/blob/master/api/dialog.md#dialog).
  */
  var isUIAvailable( default, null ): Bool;
  
  var defaultPalette: Palette;
  
  /*
    Check the [app.command](https://github.com/aseprite/api/blob/master/api/app_command.md#appcommand) documentation.
  */
  var command( default, null ): AppCommand;
  
  /*
    Check the [app.fs](https://github.com/aseprite/api/blob/master/api/app_fs.md#appfs) documentation.
  */
  var fs( default, null ): AppFS;
  
  /*
    This [pixelColor namespace](https://github.com/aseprite/api/blob/master/api/pixelcolor.md#apppixelcolor) contains internal functions
    to handle color at the lowest level.
  */
  var pixelColor( default, null ): AppPixelColor;
  
  /*
    Check the [app.preferences](https://github.com/aseprite/api/blob/master/api/app_preferences.md#apppreferences) documentation.
  */
  var preferences( default, null ): AppPreferences;
  
  /*
    ```lua
    app.open(filename)
    ```
    
    Opens a new sprite loading it from the given filename. Returns an
    instance of the [Sprite class](https://github.com/aseprite/api/blob/master/api/sprite.md#sprite) or `nil` if something went
    wrong.
  */
  @:luaDotMethod function open( filename: String ): Null< Sprite >;
  
  /*
    ```lua
    app.exit()
    ```
    
    Closes the application. It's like clicking *File > Exit* menu option.
  */
  @:luaDotMethod function exit(): Void;
  
  /*
    ```lua
    app.transaction(
      function()
        ...
      end)
    ```
    
    Creates a new transaction so you can group several sprite
    modifications in just one undo/redo operation.
    
    The function in the argument is called inside the transaction, if the
    function fails, the whole transaction is undone. If the function
    successes, the transaction is committed and then all actions will be
    grouped in just one undo/redo operation.
  */
  @:luaDotMethod function transaction( transaction: () -> Void ): Void;
  
  /*
    ```lua
    app.undo()
    ```
    
    Undoes the latest operation in the [`activeSprite`](https://github.com/aseprite/api/blob/master/api/app.md#appactivesprite).
    It's like calling `app.command.Undo()` (the *Edit > Undo*  menu option).
  */
  @:luaDotMethod function undo(): Void;
  
  /*
    ```lua
    app.redo()
    ```
    
    Redoes the latest undone operation in the
    [`activeSprite`](https://github.com/aseprite/api/blob/master/api/app.md#appactivesprite).  It's like calling
    `app.command.Redo()` (the *Edit > Redo*  menu option).
  */
  @:luaDotMethod function redo(): Void;
  
  /*
    ```lua
    app.alert "Text"
    app.alert("Text")
    app.alert{title="Title", text="Text", buttons="OK"}
    app.alert{title="Title", text="Text", buttons={"OK", "Cancel"}}
    app.alert{title="Title", text={"Line 1", "Line 2", ...}, buttons={"Yes", "No", "Cancel", ...}}
    ```
    
    Shows an alert message. If `buttons` are not specified, it will show a
    message box with the `OK` button only.
    
    Returns an integer with the selected button i.e. 1 if the first button
    was clicked, 2 if the second one, etc. Example:
    
    ```lua
    local result = app.alert{ title="Warning",
                              text="Save Changes?",
                              buttons={"Yes", "No"}}
    if result == 1 then
      app.alert "Yes was pressed"
    end
    ```
  */
  @:luaDotMethod function alert( options: { ?title: String, ?text: EitherType2< String, LuaArray< String > >, ?buttons: EitherType2< String, LuaArray< String > > } ): LuaIndex;
  
  /*
    ```lua
    app.refresh()
    ```
    
    This function is available just in case you see that your script
    updates the sprite but the screen is not showing the updated state of
    the sprite. It should not be needed, but it's here just in case that
    something is not working right on the Aseprite side.
  */
  @:luaDotMethod function refresh(): Void;
  
  /*
    ```lua
    app.useTool{
     tool=string,
     color=Color,
     brush=Brush,
     points={ Point, Point, .... },
     cel=Cel,
     layer=Layer,
     frame=Frame
    }
    ```
    
    Simulates an user stroke in the canvas using the given tool.
    
    * `tool`: A string with a well known tool ID (`rectangular_marquee`,
      `elliptical_marquee`, `lasso`, `polygonal_lasso`, `magic_wand`,
      `pencil`, `spray`, `eraser`, `eyedropper`, `zoom`, `hand`, `move`,
      `slice`, `paint_bucket`, `gradient`, `line`, `curve`, `rectangle`,
      `filled_rectangle`, `ellipse`, `filled_ellipse`, `contour`,
      `polygon`, `blur`, `jumble`) or a [tool](https://github.com/aseprite/api/blob/master/api/tool.md#tool) object
    * `color`: A [color](https://github.com/aseprite/api/blob/master/api/color.md#color) object to draw with the given tool
    * `brush`: A [brush](https://github.com/aseprite/api/blob/master/api/brush.md#brush) object to draw the points
    * `points`: An array of [points](https://github.com/aseprite/api/blob/master/api/point.md#point) in the sprite canvas which
      simulate the position of where the user put the mouse to draw with
      the given tool.
    * And we can specify the `cel` or `layer`/`frame` where to draw:
      * `cel`: The specific [cel](https://github.com/aseprite/api/blob/master/api/cel.md#cel) where we want to use the tool/draw with the tool (by default [app.activeCel](https://github.com/aseprite/api/blob/master/api/app.md#appactivecel))
      * `layer`: The [layer](https://github.com/aseprite/api/blob/master/api/layer.md#layer) where we want to use the tool/draw with the tool (by default [app.activeLayer](https://github.com/aseprite/api/blob/master/api/app.md#appactivelayer))
      * `frame`: The [frame](https://github.com/aseprite/api/blob/master/api/frame.md#frame) where to draw (by default [app.activeFrame](https://github.com/aseprite/api/blob/master/api/app.md#appactiveframe))
  */
  @:luaDotMethod function useTool( options: { ?tool: ToolInput, ?color: Color, ?brush: Brush, ?points: LuaArray< PointInput >, ?cel: Cel, ?layer: Layer, ?frame: Frame } ): Void;

}
