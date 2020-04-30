package serializers;

import support.io.Files;

import data.Data;

import serializers.Serializer;


class EnumsSerializer extends Serializer {

  public function new( markdowns: Map< String, String >, enums: Map< String, EnumInfo > ) {

    super( markdowns );


    for ( name => info in enums ) {

      final content = doEnumFile( info );

      Files.output( name, content );

    }

  }


  function doValue( value: String, markdownId: String ) {

    return '${ doMarkdown( '#$markdownId.$value' ) }var $value;';

  }

  function doValues( values: Array< String >, markdownId: String ) {

    return doSections( values.map( value -> doValue( value, markdownId ) ) );

  }

  function doEnum( info: EnumInfo ) {

    final markdown = doMarkdown( info.markdownId );

    final macros = doMacros( info.macros.values );

    final name = info.name;

    final inner = doIndent( doValues( info.values, info.markdownId ) );

    final body =  doBlock( inner );

    return '${ markdown }${ macros }extern enum abstract ${ name }( Int ) ${ body }';

  }

  function doEnumFile( info: EnumInfo ) {

    return doFile( doEnum( info ) );

  }

}
