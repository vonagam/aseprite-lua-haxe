package parsers;

import sys.io.File;

using Lambda;

using support.extended.ERegExtended;

import data.Data;


class EnumsParser {

  public final data: Map< String, EnumInfo > = [];


  public function new() {

    final content = File.getContent( './inputs/aseprite/src/app/script/engine.cpp' );

    for ( regexp in ~/lua_setglobal\(L, "([^"]+)"\);\n(.+?)\n *lua_pop\(L, 1\);/s.forEach( content ) ) {

      final name = regexp.matched( 1 );

      final definitions = regexp.matched( 2 );

      final info = new EnumInfo();

      info.markdownId = '# $name';

      info.macros.values.push( { method: 'native', args: [ '"_G.$name"' ] } );

      info.name = name;

      info.values = ~/setfield_integer\(L, "([^"]+)"/.forMatch( definitions, 1 ).array();

      data[ info.name ] = info;

    }

  }

}
