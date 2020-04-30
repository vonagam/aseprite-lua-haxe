package parsers;

using StringTools;

using Lambda;

using support.extended.ERegExtended;

import support.io.Files;

import data.Data;


class ClassesParser {

  static final OPERATORS = [

    '__eq' => { op: 'a == b', args: name -> [ { name: 'value', type: name } ], lua: '{0} == {1}' },
    '__lt' => { op: 'a < b', args: name -> [ { name: 'value', type: name } ], lua: '{0} < {1}' },
    '__gt' => { op: 'a > b', args: name -> [ { name: 'value', type: name } ], lua: '{0} > {1}' },
    '__le' => { op: 'a <= b', args: name -> [ { name: 'value', type: name } ], lua: '{0} <= {1}' },
    '__ge' => { op: 'a >= b', args: name -> [ { name: 'value', type: name } ], lua: '{0} >= {1}' },

    '__add' => { op: 'a + b', args: _ -> [ { name: 'value', type: 'Any' } ], lua: '{0} + {1}' },
    '__sub' => { op: 'a - b', args: _ -> [ { name: 'value', type: 'Any' } ], lua: '{0} - {1}' },
    '__mul' => { op: 'a * b', args: _ -> [ { name: 'value', type: 'Any' } ], lua: '{0} * {1}' },
    '__div' => { op: 'a / b', args: _ -> [ { name: 'value', type: 'Any' } ], lua: '{0} / {1}' },
    '__mod' => { op: 'a % b', args: _ -> [ { name: 'value', type: 'Any' } ], lua: '{0} % {1}' },
    '__pow' => { op: 'a ^ b', args: _ -> [ { name: 'value', type: 'Any' } ], lua: '{0} ^ {1}' },
    '__unm' => { op: '-a', args: _ -> [], lua: '-{0}' },

    '__band' => { op: 'a & b', args: _ -> [ { name: 'value', type: 'Any' } ], lua: '{0} & {1}' },
    '__bor' => { op: 'a | b', args: _ -> [ { name: 'value', type: 'Any' } ], lua: '{0} | {1}' },

    '__index' => { op: '[]', args: _ -> [ { name: 'key', type: 'Any' } ], lua: '{0}[{1}]' },
    '__newindex' => { op: '[]', args: _ -> [ { name: 'key', type: 'Any' }, { name: 'value', type: 'Any' } ], lua: '{0}[{1}] = {2}' },

    '__len' => { op: '~a', args: _ -> [], lua: '#{0}' },

  ];

  static final OTHER = [ '__eq', '__gc', '__call', '__tostring', '__idiv' ];

  static final HINTED = [

    'lua_pushnil' => null,
    'lua_pushvalue' => null,
    'lua_pushcfunction' => null,
    'lua_pushinteger' => 'Int',
    'lua_pushnumber' => 'Float',
    'lua_pushboolean' => 'Bool',
    'lua_pushstring' => 'String',

    'push_new' => null,
    'push_docobj' => null,
    'push_obj' => null,
    'push_ptr' => null,
    'pushLua' => null,
    'push_brush' => 'Brush',
    'push_cel_image' => 'Image',
    'push_cels' => 'Cels',
    'push_color_space' => 'ColorSpace',
    'push_doc_range' => 'Range',
    'push_group_layers' => 'Layers',
    'push_image' => 'Image',
    'push_images' => 'Images',
    'push_layers' => 'Layers',
    'push_palette' => 'Palette',
    'push_sprite_cel' => 'Cel',
    'push_sprite_frame' => 'Frame',
    'push_sprite_frames' => 'Frames',
    'push_sprite_layers' => 'Layers',
    'push_sprite_palette' => 'Palette',
    'push_sprite_palettes' => 'Palettes',
    'push_sprite_selection' => 'Selection',
    'push_sprite_slices' => 'Slices',
    'push_sprite_tags' => 'Tags',
    'push_sprites' => 'Sprites',
    'push_tool' => 'Tool',
    'push_version' => 'Version',
    'push_image_iterator_function' => null, // TODO;

  ];


  public final data: Map< String, ClassInfo > = [];


  final registry: Map< String, String > = [ 'app::Color' => 'Color' ];


  public function new() {

    final files = Files.collect( './inputs/aseprite/src/app/script', 'cpp' );

    for ( content in files ) {

      for ( name in getClassNames( content ) ) {

        registry[ getClassMeta( content, name ) ] = registry[ name ] = name;

      }

    }

    for ( content in files ) {

      for ( name in getClassNames( content ) ) {

        data[ name ] = getClassInfo( content, name );

      }

    }

  }


  function getClassNames( content: String ) {

    final names = new Array< String >();

    final addName = ( name: String ) -> names.has( name ) ? null : names.push( name );

    for ( name in ~/REG_CLASS\(L, ([^\)]+)\);/.forMatch( content, 1 ) ) addName( name );

    for ( name in ~/const luaL_Reg ([^_]+)_methods\[\] =/.forMatch( content, 1 ) ) addName( name );

    return names;

  }

  function getClassMeta( content: String, name: String ): String {

    var meta = new EReg( 'using $name = ([^;]+);', '' ).getMatch( content, 1 );

    if ( meta != null ) return meta;

    meta = new EReg( 'using ([^:]+::$name);', '' ).getMatch( content, 1 );

    if ( meta != null ) return meta;

    return name;

  }

  function getHints( content: String, method: String ) {

    final body = new EReg( 'int $method\\(lua_State\\* L\\)(.+?)\\n}', 's' ).getMatch( content, 1 );

    final hints = [];

    if ( body == null ) return hints;

    for ( hint in ~/ ([a-z_<>:]+)\(L[,\)]/i.forMatch( body, 1 ) ) hints.push( hint );

    for ( hint in ~/return (\d+);/.forMatch( body, 1 ) ) hints.push( hint );

    return hints;

  }

  function getType( hints: Array< String >, method: String ): String {

    if ( hints.has( '0' ) && ! hints.has( '1' ) ) return 'Void';

    var type: Null< String > = null;

    for ( hint in hints ) {

      if ( ! hint.contains( 'push' ) ) continue;

      type = ~/push_new<([^>]+)>/.getMatch( hint, 1 ); if ( type != null ) break;

      type = ~/push_obj<([^>]+)>/.getMatch( hint, 1 ); if ( type != null ) break;

      type = ~/push_docobj<([^>]+)>/.getMatch( hint, 1 ); if ( type != null ) break;

      type = HINTED[ hint ]; if ( type != null ) break;

      if ( ! HINTED.exists( hint ) ) trace( 'Unknown lua push $hint in $method' );

    }

    if ( type == null ) return 'Any';

    if ( registry.exists( type ) ) type = registry[ type ];

    return type;

  }

  function getClassConstructorInfo( content: String, name: String ) {

    final constructed = new EReg( 'REG_CLASS_NEW\\(L, $name\\);', '' ).match( content );

    if ( ! constructed ) return null;

    final info = new ClassConstructorInfo();

    info.markdownId = '## $name()';

    info.hints = getHints( content, '${ name }_new' );

    return info;

  }

  function getClassPropertiesInfo( content: String, name: String ) {

    final properties = [];

    final definitions = new EReg( 'const Property ${name}_properties\\[\\] = \\{(.+?)\\n};', 's' ).getMatch( content, 1 );

    if ( definitions == null ) return properties;

    for ( regexp in ~/{ "([^"]+)",[ \t]+([^ ,]+),[ \t]+([^ ]+) }/.forEach( definitions ) ) {

      final field = regexp.matched( 1 );

      final getterMethod = regexp.matched( 2 );

      final setterMethod = regexp.matched( 3 );

      final info = new ClassPropertyInfo();

      info.markdownId = '## $name.$field';

      info.name = field;

      if ( getterMethod == 'nullptr' ) {

        info.accessors[ 0 ] = 'null';

        info.type = 'Any';

      } else {

        info.hints = info.hints.concat( getHints( content, getterMethod ) );

        info.type = getType( info.hints, getterMethod );

      }

      if ( setterMethod == 'nullptr' ) {

        info.accessors[ 1 ] = 'null';

      } else {

        info.hints = info.hints.concat( getHints( content, setterMethod ) );

      }

      properties.push( info );

    }

    return properties;

  }

  function getClassMethodsInfo( content: String, name: String ) {

    final methods = [];

    final definitions = new EReg( 'const luaL_Reg ${name}_methods\\[\\] = \\{(.+?)\\n};', 's' ).getMatch( content, 1 );

    if ( definitions == null ) return methods;

    for ( regexp in ~/{ "([^"]+)",[ \t]+([^ ]+) }/.forEach( definitions ) ) {

      final field = regexp.matched( 1 );

      final method = regexp.matched( 2 );

      if ( field.startsWith( '_' ) ) continue;

      final info = new ClassMethodInfo();

      info.markdownId = '## $name:$field()';

      info.name = field;

      info.hints = getHints( content, method );

      info.type = getType( info.hints, method );

      methods.push( info );

    }

    return methods;

  }

  function getClassOperatorInfo( name: String, field: String, type: String, ?hints: Array< String > ) {

    final data = OPERATORS[ field ];

    final info = new ClassOperatorInfo();

    info.name = field;

    info.hints = hints == null ? [] : hints;

    info.type = type;

    info.args = data.args( name );

    info.op = data.op;

    info.lua = data.lua;

    return info;

  }

  function getClassOperatorsInfo( content: String, name: String ) {

    final operators = [];

    final definitions = new EReg( 'const luaL_Reg ${name}_methods\\[\\] = \\{(.+?)\\n};', 's' ).getMatch( content, 1 );

    if ( definitions == null ) return operators;

    for ( regexp in ~/{ "([^"]+)",[ \t]+([^ ]+) }/.forEach( definitions ) ) {

      final field = regexp.matched( 1 );

      final method = regexp.matched( 2 );

      if ( ! field.startsWith( '_' ) ) continue;

      if ( OTHER.indexOf( field ) != -1 ) continue;

      if ( ! OPERATORS.exists( field ) ) { trace( 'Unknown lua oparator $field' ); continue; }

      final hints = getHints( content, method );

      final type = getType( hints, method );

      final info = getClassOperatorInfo( name, field, type == 'Any' || type == 'Void' ? name : type, hints );

      operators.push( info );

    }

    for ( pair in [ [ '__lt', '__gt' ], [ '__le', '__ge' ] ] ) {

      final left = pair[ 0 ];

      final right = pair[ 1 ];

      if ( operators.count( info -> info.name == left || info.name == right ) == 1 ) {

        final opposite = operators.find( info -> info.name == left || info.name == right );

        if ( ! operators.exists( info -> info.name == left ) ) operators.push( getClassOperatorInfo( name, left, opposite.type ) );

        if ( ! operators.exists( info -> info.name == right ) ) operators.push( getClassOperatorInfo( name, right, opposite.type ) );

      }

    }

    return operators;

  }

  function getClassInfo( content: String, name: String ) {

    final constructor = getClassConstructorInfo( content, name );

    final properties = getClassPropertiesInfo( content, name );

    final methods = getClassMethodsInfo( content, name );

    final operators = getClassOperatorsInfo( content, name );


    final info = new ClassInfo();

    info.markdownId = '# $name';

    if ( constructor != null ) info.macros.values.push( { method: 'native', args: [ '"_G.$name"' ] } );

    info.name = name;

    info.constructor = constructor;

    for ( field in properties ) info.properties.values.push( field );

    for ( field in methods ) info.methods.values.push( field );

    for ( field in operators ) info.operators.values.push( field );


    return info;

  }

}
