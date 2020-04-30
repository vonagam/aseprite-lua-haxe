package serializers;

using StringTools;

using Lambda;

import data.Data;


class Serializer {

  final markdowns: Map< String, String >;


  public function new( markdowns: Map< String, String > ) {

    this.markdowns = markdowns;

  }


  function doJoin( parts: Array< String >, separator: String ) {

    return parts.filter( part -> part != '' ).join( separator );

  }

  function doIndent( part: String ) {

    return part == '' ? '' : '  ${ part.split( '\n' ).join( '\n  ' ) }';

  }

  function doWrap( middle: String, before: String, after: String, separator: String ) {

    return middle == '' ? '${ before }${ after }' : '${ before }${ separator }${ middle }${ separator }${ after }';

  }

  function doBlock( body: String ) {

    return doWrap( body, '{', '}', '\n\n' );

  }

  function doSections( sections: Array< String > ) {

    return doJoin( sections, '\n\n' );

  }

  function doType( type: String ) {

    return type == '' ? '' : ': $type';

  }

  function doMethodArg( name: String, type: String ) {

    return '${ name }${ doType( type ) }';

  }

  function doMethodArgs( args: Array< { name: String, type: String } > ) {

    return doWrap( args.map( arg -> doMethodArg( arg.name, arg.type ) ).join( ', ' ), '(', ')', ' ' );

  }

  function doCallArgs( args: Array< String > ) {

    return doWrap( args.join( ', ' ), '(', ')', ' ' );

  }

  function doCall( method: String, args: Array< String > ) {

    return '${ method }${ doCallArgs( args ) }';

  }

  function doMacro( method: String, args: Array< String > ) {

    return '@:${ doCall( method, args ) }'.replace( '()', '' );

  }

  function doMacros( macros: Array< { method: String, args: Array< String > } > ) {

    return macros.map( ( data ) -> '${ doMacro( data.method, data.args ) } ' ).join( '' );

  }

  function doHints( hints: Array< String > ) {

    return hints.length == 0 ? '' : '// ${ hints.join( ' ' ) }\n';

  }

  function doMarkdown( id: String ) {

    return markdowns.exists( id ) && markdowns[ id ] != '' ? '/*\n${ doIndent( markdowns[ id ] ) }\n*/\n' : '';

  }

  function doFile( body: String ) {

    return 'package aseprite;\n\n\n${ body }\n';

  }

}
