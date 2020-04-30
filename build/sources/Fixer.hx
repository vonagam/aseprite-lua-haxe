import data.Data;

using StringTools;

using Lambda;

using support.extended.ERegExtended;


class Fixer {

  final markdowns: Map< String, String >;

  final enums: Map< String, EnumInfo >;

  final classes: Map< String, ClassInfo >;

  final commands: Map< String, CommandInfo >;


  public function new(

    markdowns: Map< String, String >,

    enums: Map< String, EnumInfo >,

    classes: Map< String, ClassInfo >,

    commands: Map< String, CommandInfo >

  ) {

    this.markdowns = markdowns;

    this.enums = enums;

    this.classes = classes;

    this.commands = commands;


    fixApp();

    fixCommands();

    fixDotMethods();

    fixIndexing();

    fixEnumTypes();


    classes.remove( 'Section' );

    classes.remove( 'Prefix##ImageIterator' );

    classes.remove( 'RgbImageIterator' );

    classes.remove( 'IndexedImageIterator' );

    classes.remove( 'GrayscaleImageIterator' );


    fixProperties( 'App', [

      'activeSprite' => 'Sprite',

      'activeLayer' => 'Layer',

      'activeTag' => 'Tag',

      'site' => 'Site',

    ] );

    fixMethods( 'App', [

      'open' => { args: [ 'filename: String' ], type: 'Null< Sprite >' },

      'transaction' => { args: [ 'transaction: () -> Void' ], type: 'Void' },

      'alert' => {

        args: [ 'options: {

          ?title: String,

          ?text: EitherType2< String, LuaArray< String > >,

          ?buttons: EitherType2< String, LuaArray< String > >

        }' ],

        type: 'LuaIndex',

      },

      'useTool' => {

        args: [

          'options: {

            ?tool: ToolInput,

            ?color: Color,

            ?brush: Brush,

            ?points: LuaArray< PointInput >,

            ?cel: Cel,

            ?layer: Layer,

            ?frame: Frame,

          }',

        ],

      },

    ] );


    fixOperators( 'AppCommand', [

      '__index' => { args: [ 'name: String' ], type: 'Command< Any >' },

    ] );


    fixProperties( 'AppFS', [

      'currentPath' => 'String',

      'appPath' => 'String',

      'tempPath' => 'String',

      'userDocsPath' => 'String',

    ] );

    fixMethods( 'AppFS', [

      'filePath' => { args: [ 'path: String' ], type: 'String' },

      'fileName' => { args: [ 'path: String' ], type: 'String' },

      'fileExtension' => { args: [ 'path: String' ], type: 'String' },

      'fileTitle' => { args: [ 'path: String' ], type: 'String' },

      'filePathAndTitle' => { args: [ 'path: String' ], type: 'String' },

      'normalizePath' => { args: [ 'path: String' ], type: 'String' },

      'joinPath' => { args: [ 'paths: haxe.extern.Rest< String >' ] },

      'isFile' => { args: [ 'path: String' ] },

      'isDirectory' => { args: [ 'path: String' ] },

      'fileSize' => { args: [ 'path: String' ] },

      'listFiles' => { args: [ 'path: String' ], type: 'LuaArray< String >' },

    ] );


    fixMethods( 'PixelColor', [

      'rgba' => { args: [ 'r: IntInput, g: IntInput, b: IntInput, ?a: IntInput' ], type: 'PixelColor' },

      'rgbaR' => { args: [ 'color: PixelColor' ] },

      'rgbaG' => { args: [ 'color: PixelColor' ] },

      'rgbaB' => { args: [ 'color: PixelColor' ] },

      'rgbaA' => { args: [ 'color: PixelColor' ] },

      'graya' => { args: [ 'v: IntInput, ?a: IntInput' ], type: 'PixelColor' },

      'grayaV' => { args: [ 'color: PixelColor' ] },

      'grayaA' => { args: [ 'color: PixelColor' ] },

    ] );


    classes[ 'AppPreferences' ].methods.values.push( new ClassMethodInfo( function( info ) {

      info.markdownId = '## app.preferences.tool()';

      info.macros.values.push( { method: 'luaDotMethod', args: [] } );

      info.name = 'tool';

      info.type = 'Dynamic';

      info.args = toArgs( [ 'tool: ToolInput' ] );

    } ) );

    classes[ 'AppPreferences' ].methods.values.push( new ClassMethodInfo( function( info ) {

      info.markdownId = '## app.preferences.document()';

      info.macros.values.push( { method: 'luaDotMethod', args: [] } );

      info.name = 'document';

      info.type = 'Dynamic';

      info.args = toArgs( [ '?sprite: Sprite' ] );

    } ) );

    fixOperators( 'AppPreferences', [

      '__index' => { args: [ 'section: String' ], type: 'Dynamic' },

    ] );


    fixConstructor( 'Brush', { args: [ 'options: {

      size: IntInput,

      type: BrushType,

      angle: IntInput,

      center: Point,

      image: Image,

      patter: BrushPattern,

      patternOrigin: Point

    }' ] } );

    fixProperties( 'Brush', [

      'center' => 'Point',

      'patternOrigin' => 'Point',

    ] );

    fixMethods( 'Brush', [

      'setFgColor' => { args: [ 'color: PixelColor' ] },

      'setBgColor' => { args: [ 'color: PixelColor' ] },

    ] );


    fixProperties( 'Cel', [

      'sprite' => 'Sprite',

      'layer' => 'Layer',

      'frameNumber' => 'LuaIndex',

      'color' => 'Color',

      'data' => 'String',

    ] );


    fixConstructor( 'Color', { args: [ '?options: AnyColorInput' ], overloads: [

      [ 'options: { r: IntInput, g: IntInput, b: IntInput, ?a: IntInput }' ],

      [ 'options: { red: IntInput, green: IntInput, blue: IntInput, ?alpha: IntInput }' ],

      [ 'options: { h: FloatInput, s: FloatInput, v: FloatInput, ?a: IntInput }' ],

      [ 'options: { hue: FloatInput, saturation: FloatInput, value: FloatInput, ?alpha: IntInput }' ],

      [ 'options: { h: FloatInput, s: FloatInput, l: FloatInput, ?a: IntInput }' ],

      [ 'options: { hue: FloatInput, saturation: FloatInput, lightness: FloatInput, ?alpha: IntInput }' ],

      [ 'options: { gray: FloatInput, ?alpha: IntInput }' ],

      [ 'values: haxe.extern.Rest< Int >' ],

    ] } );

    fixProperties( 'Color', [

      'hue' => 'Float',

      'saturation' => 'Float',

      'rgbaPixel' => 'PixelColor',

      'grayPixel' => 'PixelColor',

    ] );


    fixConstructor( 'ColorSpace', { args: [

      '?options: EitherType3< ColorSpace, { sRGB: Any }, { fromFile: String } >',

    ] } );


    addTypedefs( 'Dialog', [

      { name: 'DialogWidgetOptions', type: '{ ?id: String, ?label: String, ?focus: Boolean }' },

      { name: 'DialogTextWidgetOptions', type: 'DialogWidgetOptions & { ?text: String }' },

      { name: 'DialogButtonWidgetOptions', type: 'DialogTextWidgetOptions & { ?onclick: () -> Void, ?selected: Boolean }' },

    ] );

    fixConstructor( 'Dialog', { args: [

      'options: EitherType2< String, { ?title: String, ?onclose: () -> Void } >',

    ] } );

    fixProperties( 'Dialog', [

      'data' => 'Any',

    ] );

    fixMethods( 'Dialog', [

      'show' => { args: [ '?options: { ?wait: Bool, ?bounds: RectangleInput }' ] },

      'newrow' => { args: [ '?options: { ?always: Bool }' ] },

      'separator' => { args: [ '?options: EitherType2< String, { ?text: String } >' ] },

      'label' => { args: [ 'options: DialogTextWidgetOptions' ] },

      'button' => { args: [ 'options: DialogButtonWidgetOptions' ] },

      'check' => { args: [ 'options: DialogButtonWidgetOptions' ] },

      'radio' => { args: [ 'options: DialogButtonWidgetOptions' ] },

      'entry' => { args: [ 'options: DialogTextWidgetOptions' ] },

      'number' => { args: [ 'options: DialogTextWidgetOptions & { ?decimals: Int }' ] },

      'slider' => { args: [ 'options: DialogWidgetOptions & { ?min: Int, ?max: Int, ?value: Int }' ] },

      'combobox' => { args: [ 'options: DialogWidgetOptions & { options: LuaArray< String >, ?option: String }' ] },

      'color' => { args: [ 'options: DialogWidgetOptions & { ?color: Color, ?onchange: ( { ?color: Color } ) -> Void }' ] },

      'shades' => { args: [ 'options: DialogWidgetOptions & { colors: LuaArray< Color >, ?mode: String, ?onclick: ( { button: MouseButton, ?color: Color } ) -> Void }' ] },

      'file' => { args: [ 'options: DialogWidgetOptions & { ?filename: String, ?save: Bool, ?title: String, ?entry: Bool, ?filetypes: LuaArray< String >, ?onchange: () -> Void }' ] },

      'modify' => { args: [ 'options: { ?id: String, ?enabled: Bool, ?selected: Bool, ?visible: Bool, ?text: String, ?label: String, ?focus: Bool }' ] },

    ] );

    for ( info in classes[ 'Dialog' ].methods ) {

      info.type = 'Void';

    }


    fixProperties( 'Frame', [

      'frameNumber' => 'LuaIndex',

    ] );


    fixConstructor( 'Image', { args: [

      'options: EitherType5< Image, ImageSpec, Sprite, { fromFile: String }, {

        width: Int,

        height: Int,

        colorMode: ColorMode,

      } >',

    ], overloads: [

      [ 'width: Int', 'height: Int', '?colorMode: ColorMode' ],

    ] } );

    fixProperties( 'Image', [

      'colorMode' => 'ColorMode',

      'spec' => 'ImageSpec',

    ] );

    fixMethods( 'Image', [

      'clear' => { args: [ '?color: AnyColorInput' ] },

      'getPixel' => { args: [ 'x: IntInput', 'y: IntInput' ], type: 'PixelColor' },

      'drawPixel' => { args: [ 'x: IntInput', 'y: IntInput', 'color: PixelColor' ] },

      'drawImage' => { args: [ 'image: Image', '?position: PointInput' ] },

      'drawSprite' => { args: [ 'sprite: Sprite', 'frame: FrameNumberInput', '?position: PointInput' ] },

      'pixels' => { args: [ '?rectangle: Rectangle' ], type: 'lua.NativeIterator< ImageIteratorObject >' },

      'isEqual' => { args: [ 'image: Image' ] },

      'isPlain' => { args: [ 'color: AnyColorInput' ] },

      'saveAs' => { args: [ 'options: EitherType2< String, { filename: String, ?palette: Palette } >' ] },

      'resize' => { args: [ 'options: { ?width: Int, ?height: Int, ?size: SizeInput, ?method: String, ?pivot: PointInput }' ] },

    ] );

    removeMethods( 'Image', [ 'putPixel', 'putImage', 'putSprite' ] );


    fixConstructor( 'ImageSpec', { args: [

      'options: EitherType2< ImageSpec, { ?width: Int, ?height: Int, ?colorMode: ColorMode, ?transparentColor: PixelColor } >',

    ] } );

    fixProperties( 'ImageSpec', [

      'colorMode' => 'ColorMode',

      'transparentColor' => 'PixelColor',

    ] );


    fixProperties( 'Layer', [

      'parent' => 'EitherType2< Sprite, Layer >',

      'stackIndex' => 'LuaIndex',

      'color' => 'Color',

      'data' => 'String',

    ] );

    fixMethods( 'Layer', [

      'cel' => { args: [ 'frame: FrameNumberInput' ], type: 'Null< Cel >' },

    ] );


    fixConstructor( 'Palette', { args: [

      'options: EitherType4< Palette, Int, { fromFile: String }, { fromResource: String } >',

    ] } );

    fixProperties( 'Palette', [

      'frameNumber' => 'LuaIndex',

    ] );

    fixMethods( 'Palette', [

      'resize' => { args: [ 'size: Int' ], type: 'Void' },

      'getColor' => { args: [ 'index: Int' ] },

      'setColor' => { args: [ 'index: Int', 'color: AnyColorInput' ] },

      'saveAs' => { args: [ 'filename: String' ] },

    ] );


    fixMethods( 'Plugin', [

      'newCommand' => { args: [ 'options: { id: String, ?title: String, ?group: String, ?onclick: () -> Void }' ] },

      'deleteCommand' => { args: [ 'id: EitherType2< String, { id: String } >' ] },

    ] );


    fixConstructor( 'Point', { args: [

      'options: PointInput',

    ] } );

    fixOperators( 'Point', [

      '__add' => { args: [ 'value: EitherType2< Point, Int >' ] },

      '__sub' => { args: [ 'value: EitherType2< Point, Int >' ] },

      '__mul' => { args: [ 'value: Int' ] },

      '__div' => { args: [ 'value: Int' ] },

      '__pow' => { args: [ 'value: Int' ] },

      '__mod' => { args: [ 'value: Int' ] },

    ] );


    fixProperties( 'Range', [

      'colors' => 'LuaArray< Int >',

    ] );

    fixMethods( 'Range', [

      'contains' => { args: [ 'object: EitherType4< Layer, Cel, Frame, Int >' ] },

      'containsColor' => { args: [ 'index: Int' ] },

    ] );


    fixConstructor( 'Rectangle', { args: [

      'options: RectangleInput',

    ] } );

    fixMethods( 'Rectangle', [

      'contains' => { args: [ 'rectangle: Rectangle' ] },

      'intersects' => { args: [ 'rectangle: Rectangle' ] },

      'union' => { args: [ 'rectangle: Rectangle' ], type: 'Rectangle' },

      'intersect' => { args: [ 'rectangle: Rectangle' ], type: 'Rectangle' },

    ] );

    fixOperators( 'Rectangle', [

      '__band' => { args: [ 'value: Rectangle' ] },

      '__bor' => { args: [ 'value: Rectangle' ] },

    ] );


    fixConstructor( 'Selection', { args: [

      '?selection: RectangleInput',

    ] } );

    fixMethods( 'Selection', [

      'select' => { args: [ 'selection: Selection' ], overloads: [ { args: [ 'rectangle: RectangleInput' ] } ] },

      'add' => { args: [ 'selection: Selection' ], overloads: [ { args: [ 'rectangle: RectangleInput' ] } ] },

      'subtract' => { args: [ 'selection: Selection' ], overloads: [ { args: [ 'rectangle: RectangleInput' ] } ] },

      'intersect' => { args: [ 'selection: Selection' ], overloads: [ { args: [ 'rectangle: RectangleInput' ] } ] },

      'contains' => { args: [ 'point: PointInput' ] },

    ] );


    fixProperties( 'Site', [

      'sprite' => 'Sprite',

      'frameNumber' => 'LuaIndex',

    ] );


    fixConstructor( 'Size', { args: [

      'options: SizeInput',

    ] } );

    fixOperators( 'Size', [

      '__add' => { args: [ 'value: EitherType2< Size, Int >' ] },

      '__sub' => { args: [ 'value: EitherType2< Size, Int >' ] },

      '__mul' => { args: [ 'value: Int' ] },

      '__div' => { args: [ 'value: Int' ] },

      '__mod' => { args: [ 'value: Int' ] },

      '__pow' => { args: [ 'value: Int' ] },

    ] );


    fixProperties( 'Slice', [

      'sprite' => 'Sprite',

      'color' => 'Color',

      'data' => 'String',

    ] );


    fixOperators( 'Slices', [

      '__index' => { type: 'Slice' },

    ] );


    fixConstructor( 'Sprite', { args: [

      'options: EitherType4< Sprite, ImageSpec, { fromFile: String }, {

        width: Int,

        height: Int,

        ?colorMode: ColorMode,

      } >',

    ], overloads: [

      [ 'width: Int', 'height: Int', '?colorMode: ColorMode' ],

    ] } );

    fixProperties( 'Sprite', [

      'colorMode' => 'ColorMode',

      'spec' => 'ImageSpec',

      'backgroundLayer' => 'Null< Layer >',

    ] );

    fixMethods( 'Sprite', [

      'resize' => { args: [ 'size: SizeInput' ] },

      'crop' => { args: [ '?rectangle: RectangleInput' ] },

      'saveAs' => { args: [ 'filename: String' ], type: 'Bool' },

      'saveCopyAs' => { args: [ 'filename: String' ], type: 'Bool' },

      'loadPalette' => { args: [ 'filename: String' ] },

      'setPalette' => { args: [ 'palette: Palette' ] },

      'assignColorSpace' => { args: [ 'colorSpace: ColorSpace' ], type: 'Void' },

      'convertColorSpace' => { args: [ 'colorSpace: ColorSpace' ], type: 'Void' },

      'newLayer' => { type: 'Layer' },

      'newGroup' => { type: 'Layer' },

      'deleteLayer' => { args: [ 'layer: EitherType2< Layer, String >' ] },

      'newFrame' => { args: [ '?frame: FrameNumberInput' ] },

      'newEmptyFrame' => { args: [ '?frame: FrameNumberInput' ] },

      'deleteFrame' => { args: [ 'frame: FrameNumberInput' ] },

      'newCel' => { args: [ 'layer: Layer', 'frame: FrameNumberInput', '?image: Image', '?position: PointInput' ], type: 'Cel' },

      'deleteCel' => { args: [ 'cel: Cel' ], overloads: [ { args: [ 'layer: Layer', 'frame: FrameNumberInput' ] } ] },

      'newTag' => { args: [ 'from: FrameNumberInput', 'to: FrameNumberInput' ], type: 'Tag' },

      'deleteTag' => { args: [ 'tag: EitherType2< Tag, String >' ] },

      'newSlice' => { args: [ '?rectangle: RectangleInput' ], type: 'Slice' },

      'deleteSlice' => { args: [ 'slice: EitherType2< Slice, String >' ] },

    ] );


    fixProperties( 'Tag', [

      'sprite' => 'Sprite',

      'aniDir' => 'AniDir',

    ] );


    fixOperators( 'Tags', [

      '__index' => { type: 'Tag' },

    ] );


    fixConstructor( 'Version', { args: [

      '?version: EitherType2< Version, String >',

    ] } );

  }


  function replaceMarkdownId( info: { markdownId: String }, reg: EReg, with: String ) {

    info.markdownId = reg.replace( info.markdownId, with );

  }

  function fixMarkdownsId( name: String, reg: EReg, with: String ) {

    final info = classes[ name ];

    replaceMarkdownId( info, reg, with );

    for ( info in info.properties ) replaceMarkdownId( info, reg, with );

    for ( info in info.methods ) replaceMarkdownId( info, reg, with );

  }

  function toArgs( strings: Array< String > ) {

    final args = strings.map( function( string ) {

      final regexp = ~/^([^:]+): (.+)$/s.getResult( string );

      var name = regexp.matched( 1 );

      var type = regexp.matched( 2 );

      type = ~/ *\n+ */g.replace( type, ' ' );

      type = ~/, }$/.replace( type, ' }' );

      final arg = { name: name, type: type };

      return arg;

    } );

    return args;

  }

  function fixConstructor( name, fix: { ?args: Array< String >, ?overloads: Array< Array< String > > } ) {

    final constructor = classes[ name ].constructor;

    if ( fix.args != null ) constructor.args = toArgs( fix.args );

    if ( fix.overloads != null ) constructor.overloads = fix.overloads.map( strings -> { args: toArgs( strings ) } );

  }

  function fixProperties( name: String, types: Map< String, String > ) {

    final properties = classes[ name ].properties;

    for ( key => type in types ) {

      properties.get( key ).type = type;

    }

  }

  function fixMethods( name: String, fixes: Map< String, { ?args: Array< String >, ?type: String, ?overloads: Array< { args: Array< String >, ?type: String } > } > ) {

    final methods = classes[ name ].methods;

    for ( key => fix in fixes ) {

      final methodInfo = methods.get( key );

      if ( fix.args != null ) methodInfo.args = toArgs( fix.args );

      if ( fix.type != null ) methodInfo.type = fix.type;

      if ( fix.overloads != null ) for ( fix in fix.overloads ) {

        final args = fix.args == null ? [] : toArgs( fix.args );

        final type = fix.type == null ? methodInfo.type : fix.type;

        methodInfo.overloads.push( { args: args, type: type } );

      }

    }

  }

  function removeMethods( name: String, keys: Array< String > ) {

    final methods = classes[ name ].methods;

    for ( key in keys ) {

      methods.remove( key );

    }

  }

  function fixOperators( name: String, fixes: Map< String, { ?args: Array< String >, ?type: String } > ) {

    final operators = classes[ name ].operators;

    for ( key => fix in fixes ) {

      final operatorInfo = operators.get( key );

      if ( fix.args != null ) operatorInfo.args = toArgs( fix.args );

      if ( fix.type != null ) operatorInfo.type = fix.type;

    }

  }

  function addTypedefs( name: String, typedefs: Array< { name: String, type: String } > ) {

    final info = classes[ name ];

    for ( fix in typedefs ) {

      info.typedefs.values.push( fix );

    }

  }

  function fixAppPart( name: String, key: String, ?type: String ) {

    fixMarkdownsId( name, new EReg( ' $name', '' ), ' app.$key' );

    classes[ 'App' ].properties.values.push( new ClassPropertyInfo( function( info ) {

      info.markdownId = '## app.$key';

      info.name = key;

      info.type = type == null ? name : type;

      info.accessors[ 1 ] = 'null';

    } ) );

  }

  function fixApp() {

    fixMarkdownsId( 'App', ~/ App/, ' app' );

    fixAppPart( 'AppCommand', 'command' );

    fixAppPart( 'AppFS', 'fs' );

    fixAppPart( 'PixelColor', 'pixelColor', 'AppPixelColor' );

    fixAppPart( 'AppPreferences', 'preferences' );


    classes[ 'PixelColor' ].name = 'AppPixelColor';

  }

  function fixCommands() {

    final info = classes[ 'AppCommand' ];

    for ( command in commands ) {

      info.properties.values.push( new ClassPropertyInfo( function( info ) {

        final params = command.params.map( ( param ) -> '?${ param.name }: ${ param.type }' ).join( ', ' );

        info.markdownId = command.markdownId;

        info.name = command.name;

        info.type = 'Command< ${ params.length == 0 ? '{}' : '{ $params }' } >';

        info.accessors[ 1 ] = 'null';

      } ) );

    }

  }

  function fixDotMethods() {

    for ( classInfo in classes ) {

      for ( methodInfo in classInfo.methods ) {

        if ( ! markdowns.exists( methodInfo.markdownId ) && markdowns.exists( methodInfo.markdownId.replace( ':', '.' ) ) ) {

          replaceMarkdownId( methodInfo, ~/:/g, '.' );

          methodInfo.macros.values.push( { method: 'luaDotMethod', args: [] } );

        }

      }

    }

  }

  function fixIndexing() {

    for ( name => classInfo in classes ) {

      if ( classInfo.operators.get( '__index' ) != null ) {

        fixOperators( name, [

          '__index' => { args: [ 'index: LuaIndex' ] },

        ] );

      }

    }

  }

  function fixEnumTypes() {

    function fixEnumTypes( info: { markdownId: String, type: String } ) {

      if ( info.type != 'Int' ) return;

      final markdown = markdowns[ info.markdownId ];

      if ( markdown == null || markdown == '' ) return;

      final type = ~/\[([^\]]+)\]/.forMatch( markdown, 1 ).find( type -> enums.exists( type ) );

      if ( type == null ) return;

      info.type = type;

    }

    for ( classInfo in classes ) {

      for ( methodInfo in classInfo.methods ) fixEnumTypes( methodInfo );

      for ( propertyInfo in classInfo.properties ) fixEnumTypes( propertyInfo );

    }

  }

}
