package parsers;

import support.io.Files;

using support.extended.ERegExtended;


class MarkdownsParser {

  public final data = new Map< String, String >();


  public function new() {

    for ( name => content in Files.collect( './inputs/aseprite-api/api', 'md' ) ) {

      parse( name, content );

    }

    for ( name => content in Files.collect( './inputs/aseprite-api/api/command', 'md' ) ) {

      parse( 'command/$name', content );

    }

  }


  function parse( name: String, content: String ) {

    var id: Null< String > = null;

    var split = false;

    for ( line in content.split( '\n' ) ) {

      final header = ~/^(#+ +[^ ]+) *$/.getMatch( line, 1 );

      if ( header != null ) {

        id = header;

        data[ id ] = '';

        continue;

      }

      if ( ~/^ *$/.match( line ) ) {

        split = true;

        continue;

      }

      if ( id == null ) continue;

      line = ~/\[([^\]]+)\]\(([^\)]+)\)/g.map( line, function( regexp ) {

        var text = regexp.matched( 1 );

        var link = regexp.matched( 2 );

        if ( ! ~/^https?:/.match( link ) ) {

          link = link.charAt( 0 ) == '#' ? '${ name }${ link }' : link;

          link = 'https://github.com/aseprite/api/blob/master/api/$link';

        }

        return '[$text]($link)';

      } );

      data[ id ] = ( data[ id ] == '' ? '' : '${ data[ id ] }\n${ split ? '\n' : '' }' ) + line;

      split = false;

    }

  }

}
