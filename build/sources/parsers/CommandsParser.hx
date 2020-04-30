package parsers;

import sys.io.File;

using support.extended.ERegExtended;

import support.io.Files;

import data.Data;


class CommandsParser {

  static final TYPES = [

    'int' => 'Int',
    'double' => 'Float',
    'bool' => 'Bool',
    'std::string' => 'String',

    'app::Color' => 'Color',
    'AddColorSource' => 'AddColorSource',
    'app::SpriteSheetType' => 'SpriteSheetType',
    'SpriteSheetDataFormat' => 'SpriteSheetDataFormat',
    'ColorMode' => 'ColorMode',
    'ResizeMethod' => 'ResizeMethod',
    'filters::ColorCurve' => 'Array< PointInput >',
    'filters::TiledMode' => 'TiledMode',
    'filters::HueSaturationFilter::Mode' => 'HueSaturationFilterMode',
    'filters::OutlineFilter::Place' => 'OutlineFilterPlace',
    'filters::OutlineFilter::Matrix' => 'OutlineFilterMatrix',
    'filters::Target' => 'Int',

  ];


  public final data: Map< String, CommandInfo > = [];


  public function new() {

    final definitions = File.getContent( './inputs/aseprite/src/app/commands/commands_list.h' );

    for ( name in ~/FOR_EACH_COMMAND\(([^)]+)\)/.forMatch( definitions, 1 ) ) {

      final info = new CommandInfo();

      info.markdownId = '# $name';

      info.name = name;

      data[ name ] = info;

    }

    for ( content in Files.collect( './inputs/aseprite/src/app/commands', 'cpp' ) ) {

      parse( content );

    }

    for ( content in Files.collect( './inputs/aseprite/src/app/commands/filters', 'cpp' ) ) {

      parse( content );

    }

  }


  function parse( content: String ) {

    for ( regexp in ~/struct ([^ ]+)Params : public NewParams {(.+?)\n}/s.forEach( content ) ) {

      final name = regexp.matched( 1 );

      final definitions = regexp.matched( 2 );

      final info = data[ name ];

      for ( regexp in ~/Param<([^>]+)> ([^ ]+) {/.forEach( definitions ) ) {

        final name = regexp.matched( 2 );

        var type = regexp.matched( 1 );

        if ( ! TYPES.exists( type ) ) {

          final used = new EReg( 'using ${ type } = ([^;]+);', '' ).getMatch( content, 1 );

          if ( used != null && TYPES.exists( used ) ) {

            type = used;

          } else {

            trace( 'Unknown type ${ regexp.matched( 1 ) } for param $name' );

            continue;

          }

        }

        info.params.push( { name: name, type: TYPES[ type ] } );

      }

    }

  }

}
