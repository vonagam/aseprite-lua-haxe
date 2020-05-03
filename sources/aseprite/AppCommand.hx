package aseprite;


/**
  ```lua
  app.command.CommandName()
  app.command.CommandName { param1=value1, param2=value2, ... }
  ```
  
  Executes the given command named `CommandName` with the given
  parameters.
  
  * `app.command.About`
  * [`app.command.AddColor`](https://github.com/aseprite/api/blob/master/api/command/AddColor.md#addcolor)
  * `app.command.AdvancedMode`
  * `app.command.AutocropSprite`
  * `app.command.BackgroundFromLayer`
  * [`app.command.BrightnessContrast`](https://github.com/aseprite/api/blob/master/api/command/BrightnessContrast.md#brightnesscontrast)
  * `app.command.Cancel`
  * `app.command.CanvasSize`
  * `app.command.CelOpacity`
  * `app.command.CelProperties`
  * `app.command.ChangeBrush`
  * `app.command.ChangeColor`
  * `app.command.ChangePixelFormat`
  * `app.command.ClearCel`
  * `app.command.Clear`
  * `app.command.CloseAllFiles`
  * `app.command.CloseFile`
  * [`app.command.ColorCurve`](https://github.com/aseprite/api/blob/master/api/command/ColorCurve.md#colorcurve)
  * `app.command.ColorQuantization`
  * `app.command.ContiguousFill`
  * [`app.command.ConvolutionMatrix`](https://github.com/aseprite/api/blob/master/api/command/ConvolutionMatrix.md#convolutionmatrix)
  * `app.command.CopyCel`
  * [`app.command.CopyColors`](https://github.com/aseprite/api/blob/master/api/command/CopyColors.md#copycolors)
  * `app.command.CopyMerged`
  * `app.command.Copy`
  * `app.command.CropSprite`
  * `app.command.Cut`
  * `app.command.DeselectMask`
  * [`app.command.Despeckle`](https://github.com/aseprite/api/blob/master/api/command/Despeckle.md#despeckle)
  * `app.command.DeveloperConsole`
  * `app.command.DiscardBrush`
  * `app.command.DuplicateLayer`
  * `app.command.DuplicateSprite`
  * `app.command.DuplicateView`
  * `app.command.Exit`
  * [`app.command.ExportSpriteSheet`](https://github.com/aseprite/api/blob/master/api/command/ExportSpriteSheet.md#exportspritesheet)
  * `app.command.Eyedropper`
  * `app.command.Fill`
  * `app.command.FitScreen`
  * `app.command.FlattenLayers`
  * `app.command.Flip`
  * `app.command.FrameProperties`
  * `app.command.FrameTagProperties`
  * `app.command.FullscreenPreview`
  * `app.command.GotoFirstFrameInTag`
  * `app.command.GotoFirstFrame`
  * `app.command.GotoFrame`
  * `app.command.GotoLastFrameInTag`
  * `app.command.GotoLastFrame`
  * `app.command.GotoNextFrameWithSameTag`
  * `app.command.GotoNextFrame`
  * `app.command.GotoNextLayer`
  * `app.command.GotoNextTab`
  * `app.command.GotoPreviousFrameWithSameTag`
  * `app.command.GotoPreviousFrame`
  * `app.command.GotoPreviousLayer`
  * `app.command.GotoPreviousTab`
  * `app.command.GridSettings`
  * `app.command.Home`
  * [`app.command.HueSaturation`](https://github.com/aseprite/api/blob/master/api/command/HueSaturation.md#huesaturation)
  * `app.command.ImportSpriteSheet`
  * [`app.command.InvertColor`](https://github.com/aseprite/api/blob/master/api/command/InvertColor.md#invertcolor)
  * `app.command.InvertMask`
  * `app.command.KeyboardShortcuts`
  * `app.command.Launch`
  * `app.command.LayerFromBackground`
  * `app.command.LayerLock`
  * `app.command.LayerOpacity`
  * `app.command.LayerProperties`
  * `app.command.LayerVisibility`
  * `app.command.LinkCels`
  * `app.command.LoadMask`
  * `app.command.LoadPalette`
  * `app.command.MaskAll`
  * `app.command.MaskByColor`
  * `app.command.MaskContent`
  * `app.command.MergeDownLayer`
  * `app.command.ModifySelection`
  * `app.command.MoveCel`
  * [`app.command.MoveColors`](https://github.com/aseprite/api/blob/master/api/command/MoveColors.md#movecolors)
  * [`app.command.MoveMask`](https://github.com/aseprite/api/blob/master/api/command/MoveMask.md#movemask)
  * `app.command.NewBrush`
  * [`app.command.NewFile`](https://github.com/aseprite/api/blob/master/api/command/NewFile.md#newfile)
  * `app.command.NewFrameTag`
  * `app.command.NewFrame`
  * `app.command.NewLayer`
  * `app.command.NewSpriteFromSelection`
  * `app.command.OpenBrowser`
  * `app.command.OpenFile`
  * `app.command.OpenGroup`
  * `app.command.OpenInFolder`
  * `app.command.OpenScriptFolder`
  * `app.command.OpenWithApp`
  * `app.command.Options`
  * [`app.command.Outline`](https://github.com/aseprite/api/blob/master/api/command/Outline.md#outline)
  * `app.command.PaletteEditor`
  * `app.command.PaletteSize`
  * `app.command.PasteText`
  * `app.command.Paste`
  * `app.command.PixelPerfectMode`
  * `app.command.PlayAnimation`
  * `app.command.PlayPreviewAnimation`
  * `app.command.Redo`
  * `app.command.Refresh`
  * `app.command.RemoveFrameTag`
  * `app.command.RemoveFrame`
  * `app.command.RemoveLayer`
  * `app.command.RemoveSlice`
  * `app.command.RepeatLastExport`
  * [`app.command.ReplaceColor`](https://github.com/aseprite/api/blob/master/api/command/ReplaceColor.md#replacecolor)
  * `app.command.ReselectMask`
  * `app.command.ReverseFrames`
  * `app.command.Rotate`
  * `app.command.RunScript`
  * `app.command.SaveFileAs`
  * `app.command.SaveFileCopyAs`
  * `app.command.SaveFile`
  * `app.command.SaveMask`
  * `app.command.SavePalette`
  * `app.command.ScrollCenter`
  * `app.command.Scroll`
  * `app.command.SelectTile`
  * `app.command.SelectionAsGrid`
  * `app.command.SetColorSelector`
  * [`app.command.SetInkType`](https://github.com/aseprite/api/blob/master/api/command/SetInkType.md)
  * `app.command.SetLoopSection`
  * `app.command.SetPaletteEntrySize`
  * `app.command.SetPalette`
  * `app.command.SetSameInk`
  * `app.command.ShowAutoGuides`
  * `app.command.ShowBrushPreview`
  * `app.command.ShowExtras`
  * `app.command.ShowGrid`
  * `app.command.ShowLayerEdges`
  * `app.command.ShowOnionSkin`
  * `app.command.ShowPixelGrid`
  * `app.command.ShowSelectionEdges`
  * `app.command.ShowSlices`
  * `app.command.SliceProperties`
  * `app.command.SnapToGrid`
  * `app.command.SpriteProperties`
  * [`app.command.SpriteSize`](https://github.com/aseprite/api/blob/master/api/command/SpriteSize.md)
  * `app.command.Stroke`
  * `app.command.SwitchColors`
  * `app.command.SymmetryMode`
  * `app.command.TiledMode`
  * `app.command.Timeline`
  * `app.command.TogglePreview`
  * `app.command.ToggleTimelineThumbnails`
  * `app.command.UndoHistory`
  * `app.command.Undo`
  * `app.command.UnlinkCel`
  * `app.command.Zoom`
  
  If you cannot find a specific command, you might like to give a look at the
  [gui.xml](https://github.com/aseprite/aseprite/blob/master/data/gui.xml)
  file which contains the definitions of menus / commands + the parameters.
  
  To figure out the parameters of an undocumented command, you can:
  
  1. Choose a command (the `CommandName` part of `app.command.CommandName`) from
     [gui.xml](https://github.com/aseprite/aseprite/blob/master/data/gui.xml) file
     ( `<key command="CommandName" ...>` or `<item command="CommandName" ...>`)
  1. If those `<key>...</key>` or `<item>...</item>` XML elements contain children elements
     like `<param name="param-name1" value="param-value2" />`
     you can specify those parameters in Lua between `{ ... }`, for example:
     ```lua
     app.command.CommandName { ["param-name1"]="param-value1", ["param-name2"]="param-value2" }
     ```
  
  Another alternative is looking to the Aseprite source code:
  
  1. Choose the command you want to use and find its counterpart `.cpp` file
     in [src/app/commands/](https://github.com/aseprite/aseprite/tree/master/src/app/commands)
     (e.g. `app.command.CropSprite` has the file `cmd_crop.cpp`)
  1. Find all places in the file where `params.get` is used, the strings
     in that function are the parameter names you need to use.
  1. When setting the parameters, you'll want to write the parameters as
     below because Lua does not accept hyphens in identifiers.
     ```lua
     app.command.CommandName { ["parameter-name"]="value", ["other-parameter-name"]="otherValue" }
     ```
**/
@:forward extern abstract AppCommand( AppCommandData ) {

  @:op( [] ) private inline function __index( name: String ): Command< Any > {
    return untyped __lua__( "{0}[{1}]", this, name );
  }

}

extern class AppCommandData {

  var Zoom( default, null ): Command< {} >;
  
  var UnlinkCel( default, null ): Command< {} >;
  
  var UndoHistory( default, null ): Command< {} >;
  
  var Undo( default, null ): Command< {} >;
  
  var ToggleTimelineThumbnails( default, null ): Command< {} >;
  
  var TogglePreview( default, null ): Command< {} >;
  
  var Timeline( default, null ): Command< {} >;
  
  var TiledMode( default, null ): Command< {} >;
  
  var SymmetryMode( default, null ): Command< {} >;
  
  var SwitchColors( default, null ): Command< {} >;
  
  var Stroke( default, null ): Command< {} >;
  
  /**
    ```lua
    app.command.SpriteSize {
      ui=true,
      width=100,
      height=100,
      scale=1.0,
      scaleX=1.0,
      scaleY=1.0,
      lockRatio=false,
      method="nearest"
    }
    ```
    
    * `ui`: Shows the dialog on the screen, `true` by default. Set to `false` to modify the sprite size without asking to the user.
    * `width`: Final sprite width. Current sprite width by default.
    * `height`: Final sprite height. Current sprite height by default.
    * `scale`: Bidimensional scale factor per unit (1.0 = same original sprite size). `1.0` by default.
    * `scaleX`: horizontal scale factor per unit. `1.0` by default.
    * `scaleY`: Vertical scale factor per unit. `1.0` by default.
    * `lockRatio`: Final sprite aspect ratio is locked when it is `true`.`false` by default.
    * `method`: Resize algorithm method to be used. `"nearest"` by default (Nearest Neighbor), alternatives: `"bilinear"` and `"rotSprite"`.
    
    Known issue: On the following code, we have a variable `i` pointing to the `cel.image`. After the `app.command.SpriteSize` execution, `i` doesn't longer points to original image. Finally, `print(i.width)` will fail.
    
    ```lua
    local s = Sprite(1, 1)
    local cel = app.activeCel
    local i = cel.image
    
    app.command.SpriteSize{ ui = false, scaleX = 2 }
    
    print(i.width) -- it will fail: ...attempt to index a nil value (global 'i')
    ```
    
    So, to make it works, we have to use `cel.image` instead of `i`:
    
    ```lua
    local s = Sprite(1, 1)
    local cel = app.activeCel
    
    app.command.SpriteSize{ ui = false, scaleX = 2 }
    
    print(cel.image.width) -- it will print "2"
    ```
    Another way, using `i`, and get again the `cel.image` after `app.command.SpriteSize`:
    
    ```lua
    local s = Sprite(1, 1)
    local cel = app.activeCel
    local i = cel.image
    
    app.command.SpriteSize{ ui = false, scaleX = 2 }
    i = cel.image  -- We have to get the image again
    print(i.width) -- it will print "2"
    ```
    
    This issue will be fixed soon.
  **/
  var SpriteSize( default, null ): Command< { ?ui: Bool, ?width: Int, ?height: Int, ?lockRatio: Bool, ?scale: Float, ?scaleX: Float, ?scaleY: Float, ?method: ResizeMethod } >;
  
  var SpriteProperties( default, null ): Command< {} >;
  
  var SnapToGrid( default, null ): Command< {} >;
  
  var SliceProperties( default, null ): Command< {} >;
  
  var ShowSlices( default, null ): Command< {} >;
  
  var ShowSelectionEdges( default, null ): Command< {} >;
  
  var ShowPixelGrid( default, null ): Command< {} >;
  
  var ShowOnionSkin( default, null ): Command< {} >;
  
  var ShowLayerEdges( default, null ): Command< {} >;
  
  var ShowGrid( default, null ): Command< {} >;
  
  var ShowExtras( default, null ): Command< {} >;
  
  var ShowBrushPreview( default, null ): Command< {} >;
  
  var ShowAutoGuides( default, null ): Command< {} >;
  
  var SetSameInk( default, null ): Command< {} >;
  
  var SetPaletteEntrySize( default, null ): Command< {} >;
  
  var SetPalette( default, null ): Command< {} >;
  
  var SetLoopSection( default, null ): Command< {} >;
  
  /**
    ```lua
    app.command.SetInkType {
      type="simple"
    }
    ```
    
    * `type`: ink type set up, `"simple"` by default. Others possibles configurations: `"alpha-compositing"`, `"copy-color"`, `"lock-alpha"` and `"shading"`.
    
    More info on ink type behavior at [https://www.aseprite.org/docs/ink/](https://www.aseprite.org/docs/ink/)
  **/
  var SetInkType( default, null ): Command< {} >;
  
  var SetColorSelector( default, null ): Command< {} >;
  
  var SelectionAsGrid( default, null ): Command< {} >;
  
  var SelectTile( default, null ): Command< {} >;
  
  var ScrollCenter( default, null ): Command< {} >;
  
  var Scroll( default, null ): Command< {} >;
  
  var Screenshot( default, null ): Command< { ?save: Bool, ?srgb: Bool } >;
  
  var SavePalette( default, null ): Command< {} >;
  
  var SaveMask( default, null ): Command< {} >;
  
  var SaveFileCopyAs( default, null ): Command< {} >;
  
  var SaveFileAs( default, null ): Command< {} >;
  
  var SaveFile( default, null ): Command< {} >;
  
  var RunScript( default, null ): Command< {} >;
  
  var Rotate( default, null ): Command< {} >;
  
  var ReverseFrames( default, null ): Command< {} >;
  
  var ReselectMask( default, null ): Command< {} >;
  
  /**
    ```lua
    app.command.ReplaceColor {
      ui=true,
      channels=FilterChannels...,
      from=Color,
      to=Color,
      tolerance=0
    }
    ```
    
    * `ui`: Show the dialog on the screen, `true` by default. Set to
      `false` for automatic replacement without asking to the user for the
      change. When the dialog is displayed to the user,
      `app.command.ReplaceColor()` will return a `true` or `false` value
      indicating if the replacement was accepeted or cancelled
      respectively.
    * `channels`: A combination of [FilterChannels](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannels) with
      [bitwise OR (`|`) operator](https://www.lua.org/manual/5.3/manual.html#3.4.2).
      The default value depends on the [active sprite](https://github.com/aseprite/api/blob/master/api/../app.md#appactivesprite) [color mode](https://github.com/aseprite/api/blob/master/api/../colormode.md):
      * [RGBA](https://github.com/aseprite/api/blob/master/api/../colormode.md#colormodergb):
        [FilterChannels.RGBA](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsrgba)
      * [Grayscale](https://github.com/aseprite/api/blob/master/api/../colormode.md#colormodegray):
        [FilterChannels.GRAYA](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsgraya)
      * [Indexed](https://github.com/aseprite/api/blob/master/api/../colormode.md#colormodeindexed):
        [FilterChannels.INDEX](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsindex)
    * `from`: [Color](https://github.com/aseprite/api/blob/master/api/../color.md#color) to replace (it's the [foreground color](https://github.com/aseprite/api/blob/master/api/../app.md#appfgcolor) by default)
    * `to`: [Color](https://github.com/aseprite/api/blob/master/api/../color.md#color) to replace (it's the [background color](https://github.com/aseprite/api/blob/master/api/../app.md#appbgcolor) by default)
    * `tolerance`: Maximum allowed difference between `from` and the pixel
      in the image to apply the replacement.
  **/
  var ReplaceColor( default, null ): Command< { ?ui: Bool, ?channels: Int, ?from: Color, ?to: Color, ?tolerance: Int } >;
  
  var RepeatLastExport( default, null ): Command< {} >;
  
  var ReopenClosedFile( default, null ): Command< {} >;
  
  var RemoveSlice( default, null ): Command< {} >;
  
  var RemoveLayer( default, null ): Command< {} >;
  
  var RemoveFrameTag( default, null ): Command< {} >;
  
  var RemoveFrame( default, null ): Command< {} >;
  
  var Refresh( default, null ): Command< {} >;
  
  var Redo( default, null ): Command< {} >;
  
  var PlayPreviewAnimation( default, null ): Command< {} >;
  
  var PlayAnimation( default, null ): Command< {} >;
  
  var PixelPerfectMode( default, null ): Command< {} >;
  
  var PasteText( default, null ): Command< {} >;
  
  var Paste( default, null ): Command< {} >;
  
  var PaletteSize( default, null ): Command< {} >;
  
  var PaletteEditor( default, null ): Command< {} >;
  
  /**
    ```lua
    app.command.Outline {
      ui=true,
      channels=FilterChannels...,
      place='outside',
      matrix='circle',
      color=app.fgColor,
      bgColor=Color(),
      tiledMode='none'
    }
    ```
    
    * `ui`: Show the dialog on the screen, `true` by default.
    * `channels`: A combination of [FilterChannels](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannels) with
      [bitwise OR (`|`) operator](https://www.lua.org/manual/5.3/manual.html#3.4.2).
      The default value depends on the [active sprite](https://github.com/aseprite/api/blob/master/api/../app.md#appactivesprite) [color mode](https://github.com/aseprite/api/blob/master/api/../colormode.md):
      * [RGBA](https://github.com/aseprite/api/blob/master/api/../colormode.md#colormodergb):
        [FilterChannels.RGBA](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsrgba)
      * [Grayscale](https://github.com/aseprite/api/blob/master/api/../colormode.md#colormodegray):
        [FilterChannels.GRAYA](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsgraya)
      * [Indexed](https://github.com/aseprite/api/blob/master/api/../colormode.md#colormodeindexed):
        [FilterChannels.INDEX](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsindex)
    * `place`: `'inside'` or `'outside'`
    * `matrix`: `'circle'`, `'square'`, `'horizontal'`, or `'vertical'`
    * `color`: The [color](https://github.com/aseprite/api/blob/master/api/../color.md#color) of the outline
    * `bgColor`: The [color](https://github.com/aseprite/api/blob/master/api/../color.md#color) of the background (the
      transparent color by default on transparent layers, or the first
      pixel at the top-left corner in background layer)
    * `tiledMode`: `'none'`, `'x'`, `'y'`, `'both'`. By default it's
      `'none'` if there is no UI, or it's equal to `app.preferences.document(app.activeSprite).tiled.mode`
      when `ui` is `true`.
  **/
  var Outline( default, null ): Command< { ?ui: Bool, ?channels: Int, ?place: OutlineFilterPlace, ?matrix: OutlineFilterMatrix, ?color: Color, ?bgColor: Color, ?tiledMode: TiledMode } >;
  
  var Options( default, null ): Command< {} >;
  
  var OpenWithApp( default, null ): Command< {} >;
  
  var OpenScriptFolder( default, null ): Command< {} >;
  
  var OpenInFolder( default, null ): Command< {} >;
  
  var OpenGroup( default, null ): Command< {} >;
  
  var OpenFile( default, null ): Command< {} >;
  
  var OpenBrowser( default, null ): Command< {} >;
  
  var NewSpriteFromSelection( default, null ): Command< {} >;
  
  var NewLayer( default, null ): Command< { ?name: String, ?group: Bool, ?reference: Bool, ?ask: Bool, ?fromFile: Bool, ?fromClipboard: Bool, ?viaCut: Bool, ?viaCopy: Bool, ?top: Bool, ?before: Bool } >;
  
  var NewFrameTag( default, null ): Command< {} >;
  
  var NewFrame( default, null ): Command< {} >;
  
  /**
    ```lua
    app.command.NewFile {
      ui=true,
      width=0,
      height=0,
      colorMode=ColorMode.RGB,
      fromClipboard=false
    }
    ```
    
    * `ui`
    * `width`
    * `height`
    * `colorMode` ([ColorMode](https://github.com/aseprite/api/blob/master/api/../colormode.md#colormode))
    * `fromClipboard`
  **/
  var NewFile( default, null ): Command< { ?ui: Bool, ?width: Int, ?height: Int, ?colorMode: ColorMode, ?fromClipboard: Bool } >;
  
  var NewBrush( default, null ): Command< {} >;
  
  /**
    Moves the selection boundaries or its content (pixels).
    
    ```lua
    app.command.MoveMask {
      target='boundaries' | 'content',
      wrap=false,
      direction='left' | 'right' | 'up' | 'down',
      units='pixel',
      quantity=1
    }
    ```
    
    * `target` (string): must be
      * `'boundaries'` to modify selection boundaries onlyor
      * `'content'` to modify the selection content ([active cel](https://github.com/aseprite/api/blob/master/api/../app.md#appactivecel) pixels)
    * `wrap`: `true` or `false`, when true it does the *Edit > Shift* effect,
      were pixels from one side in will appear from the other side (so the
      content is shifted and pixels wrapped, so the selection boundaries
      is not moved at all, only pixels inside it)
    * `direction` (string): the selection will be moved to a specific direction:
      * `'left'`
      * `'right'`
      * `'up'`
      * `'down'`
    * `units` (string): must be one of these options (generally `pixel` is
      enough for scripts, and other options are just for UI):
      * `'pixel'`
      * `'tile-width'`
      * `'tile-height'`
      * `'zoomed-pixel'`
      * `'zoomed-tile-width'`
      * `'zoomed-tile-height'`
      * `'viewport-width'`
      * `'viewport-height'`
    * `quantity`: the number of `pixel`s, or `tile-width`s, etc. to move
      the selection to the given `direction` depending on the `units`
  **/
  var MoveMask( default, null ): Command< {} >;
  
  /**
    ```lua
    app.command.MoveColors {
      before=colorIndex
    }
    ```
    
    Moves the range selected colors
    [`app.range.colors`](https://github.com/aseprite/api/blob/master/api/../range.md#rangecolors) before the given
    `colorIndex`.
  **/
  var MoveColors( default, null ): Command< { ?before: Int } >;
  
  var MoveCel( default, null ): Command< {} >;
  
  var ModifySelection( default, null ): Command< {} >;
  
  var MergeDownLayer( default, null ): Command< {} >;
  
  var MaskContent( default, null ): Command< {} >;
  
  var MaskByColor( default, null ): Command< {} >;
  
  var MaskAll( default, null ): Command< {} >;
  
  var LoadPalette( default, null ): Command< {} >;
  
  var LoadMask( default, null ): Command< {} >;
  
  var LinkCels( default, null ): Command< {} >;
  
  var LayerVisibility( default, null ): Command< {} >;
  
  var LayerProperties( default, null ): Command< {} >;
  
  var LayerOpacity( default, null ): Command< {} >;
  
  var LayerLock( default, null ): Command< {} >;
  
  var LayerFromBackground( default, null ): Command< {} >;
  
  var Launch( default, null ): Command< {} >;
  
  var KeyboardShortcuts( default, null ): Command< {} >;
  
  var InvertMask( default, null ): Command< {} >;
  
  /**
    ```lua
    app.command.InvertColor {
      ui=true,
      channels=FilterChannels...
    }
    ```
    
    * `ui`: Shows the dialog on the screen, `true` by default. Set to
      `false` for automatic invert colors without asking to the user for
      the change.
    * `channels`: A combination of [FilterChannels](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannels) with
      [bitwise OR (`|`) operator](https://www.lua.org/manual/5.3/manual.html#3.4.2).
      By default it is equal to:
      [FilterChannels.RED](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsred) |
      [FilterChannels.GREEN](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsgreen) |
      [FilterChannels.BLUE](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsblue) |
      [FilterChannels.GRAY](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsgray).
  **/
  var InvertColor( default, null ): Command< { ?ui: Bool, ?channels: Int } >;
  
  var ImportSpriteSheet( default, null ): Command< {} >;
  
  /**
    ```lua
    app.command.HueSaturation {
      ui=true,
      channels=FilterChannels...,
      mode='hsl',
      hue=0,
      saturation=0,
      lightness=0,
      alpha=0
    }
    ```
    
    * `ui`: Shows the dialog on the screen, `true` by default. Set to
      `false` for automatic change brightness and/or contrast without
      asking to the user for the change.
    * `channels`: A combination of [FilterChannels](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannels) with
      [bitwise OR (`|`) operator](https://www.lua.org/manual/5.3/manual.html#3.4.2).
      By default it is equal to:
      [FilterChannels.RED](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsred) |
      [FilterChannels.GREEN](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsgreen) |
      [FilterChannels.BLUE](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsblue) |
      [FilterChannels.GRAY](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsgray).
    * `mode`: `'hsl'` (default) or `'hsv'`
    * `hue`: From `-180` to `180`
    * `saturation`: From `-100` to `100`
    * `lightness` (or `value`): From `-100` to `100`
    * `alpha`: From `-100` to `100`
  **/
  var HueSaturation( default, null ): Command< { ?ui: Bool, ?channels: Int, ?mode: HueSaturationFilterMode, ?hue: Float, ?saturation: Float, ?lightness: Float, ?alpha: Float } >;
  
  var Home( default, null ): Command< {} >;
  
  var GridSettings( default, null ): Command< {} >;
  
  var GotoPreviousTab( default, null ): Command< {} >;
  
  var GotoPreviousLayer( default, null ): Command< {} >;
  
  var GotoPreviousFrameWithSameTag( default, null ): Command< {} >;
  
  var GotoPreviousFrame( default, null ): Command< {} >;
  
  var GotoNextTab( default, null ): Command< {} >;
  
  var GotoNextLayer( default, null ): Command< {} >;
  
  var GotoNextFrameWithSameTag( default, null ): Command< {} >;
  
  var GotoNextFrame( default, null ): Command< {} >;
  
  var GotoLastFrameInTag( default, null ): Command< {} >;
  
  var GotoLastFrame( default, null ): Command< {} >;
  
  var GotoFrame( default, null ): Command< {} >;
  
  var GotoFirstFrameInTag( default, null ): Command< {} >;
  
  var GotoFirstFrame( default, null ): Command< {} >;
  
  var FullscreenPreview( default, null ): Command< {} >;
  
  var FrameTagProperties( default, null ): Command< {} >;
  
  var FrameProperties( default, null ): Command< {} >;
  
  var Flip( default, null ): Command< {} >;
  
  var FlattenLayers( default, null ): Command< {} >;
  
  var FitScreen( default, null ): Command< {} >;
  
  var Fill( default, null ): Command< {} >;
  
  var Eyedropper( default, null ): Command< {} >;
  
  /**
    ```lua
    app.command.ExportSpriteSheet {
      ui=true,
      askOverwrite=true,
      type=SpriteSheetType.HORIZONTAL,
      columns=0,
      rows=0,
      width=0,
      height=0,
      bestFit=false,
      textureFilename="",
      dataFilename="",
      dataFormat=SpriteSheetDataFormat.JSON_HASH,
      borderPadding=0,
      shapePadding=0,
      innerPadding=0,
      trim=false,
      extrude=false,
      openGenerated=false,
      layer="",
      tag="",
      splitLayers=false,
      listLayers=true,
      listTags=true,
      listSlices=true
    }
    ```
    
    This is similar to
    using [the `-sheet` argument from the CLI](https://www.aseprite.org/docs/cli/#sheet).
    
    * `ui`
    * `askOverwrite`
    * `type` ([SpriteSheetType](https://github.com/aseprite/api/blob/master/api/../spritesheettype.md#spritesheettype))
    * `columns`
    * `rows`
    * `width`
    * `height`
    * `bestFit=false`
    * `textureFilename`
    * `dataFilename`
    * `dataFormat` ([SpriteSheetDataFormat](https://github.com/aseprite/api/blob/master/api/../spritesheetdataformat.md#spritesheetdataformat))
    * `borderPadding`
    * `shapePadding`
    * `innerPadding`
    * `trim`
    * `openGenerated`
    * `layer`
    * `tag`
    * `splitLayers`
    * `listLayers`
    * `listTags`
    * `listSlices`
  **/
  var ExportSpriteSheet( default, null ): Command< { ?ui: Bool, ?askOverwrite: Bool, ?type: SpriteSheetType, ?columns: Int, ?rows: Int, ?width: Int, ?height: Int, ?textureFilename: String, ?dataFilename: String, ?dataFormat: SpriteSheetDataFormat, ?filenameFormat: String, ?borderPadding: Int, ?shapePadding: Int, ?innerPadding: Int, ?trimSprite: Bool, ?trim: Bool, ?trimByGrid: Bool, ?extrude: Bool, ?ignoreEmpty: Bool, ?mergeDuplicates: Bool, ?openGenerated: Bool, ?layer: String, ?tag: String, ?splitLayers: Bool, ?splitTags: Bool, ?listLayers: Bool, ?listTags: Bool, ?listSlices: Bool } >;
  
  var Exit( default, null ): Command< {} >;
  
  var DuplicateView( default, null ): Command< {} >;
  
  var DuplicateSprite( default, null ): Command< {} >;
  
  var DuplicateLayer( default, null ): Command< {} >;
  
  var DiscardBrush( default, null ): Command< {} >;
  
  var DeveloperConsole( default, null ): Command< {} >;
  
  /**
    ```lua
    app.command.Despeckle {
      ui=true,
      channels=...,
      width=3,
      height=3,
      tiledMode=none,
    }
    ```
    
    * `ui`: Show the dialog on the screen, `true` by default.
    * `channels`: A combination of [FilterChannels](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannels) with
      [bitwise OR (`|`) operator](https://www.lua.org/manual/5.3/manual.html#3.4.2).
      By default it is equal to:
      [FilterChannels.RED](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsred) |
      [FilterChannels.GREEN](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsgreen) |
      [FilterChannels.BLUE](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsblue) |
      [FilterChannels.GRAY](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsgray).
    * `width`: Width of the convolution matrix to calculate the median. `3` by default.
    * `height`: Height of the convolution matrix to calculate the median. `3` by default.
    * `tiledMode`: `'none'`, `'x'`, `'y'`, `'both'`. By default it's
      `'none'` if there is no UI, or it's equal to `app.preferences.document(app.activeSprite).tiled.mode`
      when `ui` is `true`.
  **/
  var Despeckle( default, null ): Command< { ?ui: Bool, ?channels: Int, ?width: Int, ?height: Int, ?tiledMode: TiledMode } >;
  
  var DeselectMask( default, null ): Command< {} >;
  
  var Cut( default, null ): Command< {} >;
  
  var CropSprite( default, null ): Command< {} >;
  
  var CopyMerged( default, null ): Command< {} >;
  
  /**
    ```lua
    app.command.CopyColors {
      before=colorIndex
    }
    ```
    
    Copies the range selected colors
    [`app.range.colors`](https://github.com/aseprite/api/blob/master/api/../range.md#rangecolors) before the given
    `colorIndex`.
  **/
  var CopyColors( default, null ): Command< {} >;
  
  var CopyCel( default, null ): Command< {} >;
  
  var Copy( default, null ): Command< {} >;
  
  /**
    ```lua
    app.command.ConvolutionMatrix {
      ui=true,
      channels=FilterChannels...,
      tiledMode=none,
      fromResource=string
    }
    ```
    
    * `ui`: Shows the dialog on the screen, `true` by default. Set to
      `false` to apply the convolution matrix filter automatically without
      asking to the user for the change.
    * `channels`: A combination of [FilterChannels](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannels) with
      [bitwise OR (`|`) operator](https://www.lua.org/manual/5.3/manual.html#3.4.2).
      By default it is equal to:
      [FilterChannels.RED](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsred) |
      [FilterChannels.GREEN](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsgreen) |
      [FilterChannels.BLUE](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsblue) |
      [FilterChannels.GRAY](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsgray).
    * `tiledMode`: `'none'`, `'x'`, `'y'`, `'both'`. By default it's
      `'none'` if there is no UI, or it's equal to `app.preferences.document(app.activeSprite).tiled.mode`
      when `ui` is `true`.
    * `fromResource`: Name of [pre-defined convolution matrix](https://github.com/aseprite/aseprite/blob/a70a3a11c71ae96eb6af3756525182e88129ffcd/data/convmatr.def#L34).
    
    *Note*: In future versions this function should support creating
    customized convolution matrices.
  **/
  var ConvolutionMatrix( default, null ): Command< { ?ui: Bool, ?channels: Int, ?tiledMode: TiledMode, ?fromResource: String } >;
  
  var ContiguousFill( default, null ): Command< {} >;
  
  var ColorQuantization( default, null ): Command< { ?ui: Bool, ?withAlpha: Bool, ?maxColors: Int, ?useRange: Bool } >;
  
  /**
    ```lua
    app.command.ColorCurve {
      ui=true,
      channels=FilterChannels...,
      curve={ Point, Point, Point... }
    }
    ```
    
    * `ui`: Shows the dialog on the screen, `true` by default. Set to
      `false` to apply the color curve filter automatically without asking
      to the user for the change.
    * `channels`: A combination of [FilterChannels](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannels) with
      [bitwise OR (`|`) operator](https://www.lua.org/manual/5.3/manual.html#3.4.2).
      By default it is equal to:
      [FilterChannels.RED](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsred) |
      [FilterChannels.GREEN](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsgreen) |
      [FilterChannels.BLUE](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsblue) |
      [FilterChannels.GRAY](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsgray).
    * `curve`: Array of [points](https://github.com/aseprite/api/blob/master/api/../point.md#point) where X is the input
      value and Y the output value.
  **/
  var ColorCurve( default, null ): Command< { ?ui: Bool, ?channels: Int, ?curve: Array< PointInput > } >;
  
  var CloseFile( default, null ): Command< {} >;
  
  var CloseAllFiles( default, null ): Command< {} >;
  
  var ClearRecentFiles( default, null ): Command< {} >;
  
  var ClearCel( default, null ): Command< {} >;
  
  var Clear( default, null ): Command< {} >;
  
  var ChangePixelFormat( default, null ): Command< {} >;
  
  var ChangeColor( default, null ): Command< {} >;
  
  var ChangeBrush( default, null ): Command< {} >;
  
  var CelProperties( default, null ): Command< {} >;
  
  var CelOpacity( default, null ): Command< {} >;
  
  var CanvasSize( default, null ): Command< { ?left: Int, ?right: Int, ?top: Int, ?bottom: Int, ?trimOutside: Bool } >;
  
  var Cancel( default, null ): Command< {} >;
  
  /**
    ```lua
    app.command.BrightnessContrast {
      ui=true,
      channels=FilterChannels...,
      brightness=0,
      contrast=0
    }
    ```
    
    * `ui`: Shows the dialog on the screen, `true` by default. Set to
      `false` for automatic change brightness and/or contrast without
      asking to the user for the change.
    * `channels`: A combination of [FilterChannels](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannels) with
      [bitwise OR (`|`) operator](https://www.lua.org/manual/5.3/manual.html#3.4.2).
      By default it is equal to:
      [FilterChannels.RED](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsred) |
      [FilterChannels.GREEN](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsgreen) |
      [FilterChannels.BLUE](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsblue) |
      [FilterChannels.GRAY](https://github.com/aseprite/api/blob/master/api/../filterchannels.md#filterchannelsgray).
    * `brightness`: Brightness factor (`0` by default), a value between `-100` and `100`.
    * `contrast`: Contrast factor (`0` by default), a value between `-100` and `100`.
  **/
  var BrightnessContrast( default, null ): Command< { ?ui: Bool, ?channels: Int, ?brightness: Float, ?contrast: Float } >;
  
  var BackgroundFromLayer( default, null ): Command< {} >;
  
  var AutocropSprite( default, null ): Command< {} >;
  
  var AdvancedMode( default, null ): Command< {} >;
  
  /**
    ```lua
    app.command.AddColor {
      source=string,
      color=Color
    }
    ```
    
    Adds a new color into the palette.
    
    * `source`: Can be `"fg"`, `"bg"`, or `"color"` (default). To add the foreground, background, or a specific color respectively.
    * `color`: A [Color](https://github.com/aseprite/api/blob/master/api/../color.md#color) instance to add too the palette.
  **/
  var AddColor( default, null ): Command< { ?source: AddColorSource, ?color: Color } >;
  
  var About( default, null ): Command< {} >;

}
