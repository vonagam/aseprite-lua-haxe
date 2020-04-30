package serializers;

using Lambda;

import support.io.Files;

import data.Data;

import serializers.Serializer;


class ClassesSerializer extends Serializer {

  public function new( markdowns: Map< String, String >, classes: Map< String, ClassInfo > ) {

    super( markdowns );


    for ( info in classes ) {

      final content = doClassFile( info );

      Files.output( info.name, content );

    }

  }


  function doOverload( args: Array< { name: String, type: String } >, type: String ) {

    return '@:overload( function${ doMethodArgs( args) }${ doType( type ) } {})';

  }

  function doConstructorOverloads( overloads: Array< { args: Array< { name: String, type: String } > } > ) {

    return overloads.map( ( data ) -> '${ doOverload( data.args, 'Void' ) }\n' ).join( '' );

  }

  function doConstructor( info: ClassConstructorInfo ) {

    final markdown = doMarkdown( info.markdownId );

    final macros = doMacros( info.macros.values );

    final hints = doHints( info.hints );

    final args = doMethodArgs( info.args );

    final overloads = doConstructorOverloads( info.overloads );

    return '${ markdown }${ hints }${ overloads }${ macros }@:selfCall function new${ args };';

  }

  function doPropertyAccessors( accessors: Array< String > ) {

    return accessors.foreach( accessor -> accessor == 'default' ) ? '' : '( ${ accessors.join( ', ' ) } )';

  }

  function doProperty( info: ClassPropertyInfo ) {

    final markdown = doMarkdown( info.markdownId );

    final macros = doMacros( info.macros.values );

    final name = info.name;

    final hints = doHints( info.hints );

    final type = doType( info.type );

    final accessors = doPropertyAccessors( info.accessors );

    return '${ markdown }${ hints }${ macros }var ${ name }${ accessors }${ type };';

  }

  function doMethodOverloads( overloads: Array< { args: Array< { name: String, type: String } >, type: String } > ) {

    return overloads.map( ( data ) -> '${ doOverload( data.args, data.type ) }\n' ).join( '' );

  }

  function doMethod( info: ClassMethodInfo ) {

    final markdown = doMarkdown( info.markdownId );

    final macros = doMacros( info.macros.values );

    final name = info.name;

    final hints = doHints( info.hints );

    final type = doType( info.type );

    final args = doMethodArgs( info.args );

    final overloads = doMethodOverloads( info.overloads );

    return '${ markdown }${ hints }${ overloads }${ macros }function ${ name }${ args }${ type };';

  }

  function doLengthOperator() {

    final property = 'var length( get, never ): Int;';

    final getter = 'private inline function get_length(): Int {\n  return untyped __lua__( "#{0}", this );\n}';

    return '${ property }\n\n${ getter }';

  }

  function doOperatorBody( lua: String, names: Array< String > ) {

    return '{\n  return untyped ${ doCall( '__lua__', [ '"' + lua + '"', 'this' ].concat( names ) ) };\n}';

  }

  function doOperator( info: ClassOperatorInfo ) {

    if ( info.name == '__len' ) return doLengthOperator();

    final markdown = doMarkdown( info.markdownId );

    final macros = doMacros( info.macros.values );

    final name = info.name;

    final hints = doHints( info.hints );

    final type = doType( info.type );

    final args = doMethodArgs( info.args );

    final op = info.op;

    final body = doOperatorBody( info.lua, info.args.map( arg -> arg.name ) );

    return '${ markdown }${ hints }@:op( ${ op } ) ${ macros }private inline function ${ name }${ args }${ type } ${ body }';

  }

  function doIterators( info: ClassInfo ) {

    if ( ! info.operators.exists( '__index' ) || ! info.operators.exists( '__len' ) ) return '';

    final type = info.operators.get( '__index' ).type;

    final plain = 'inline function iterator(): Iterator< $type > {\n  return new CollectionIterator< $type >( this );\n}';

    final indexed = 'inline function keyValueIterator(): KeyValueIterator< Int, $type > {\n  return new CollectionIndexedIterator< $type >( this );\n}';

    return '${ plain }\n\n${ indexed }';

  }

  function doClass( info: ClassInfo ) {

    final markdown = doMarkdown( info.markdownId );

    final macros = doMacros( info.macros.values );

    final name = info.name;

    final constructor = info.constructor == null ? '' : doConstructor( info.constructor );

    final properties = doSections( info.properties.values.map( doProperty ) );

    final methods = doSections( info.methods.values.map( doMethod ) );

    final operators = doSections( info.operators.values.map( doOperator ) );

    final iterators = doIterators( info );

    final inner = doIndent( doSections( [ properties, constructor, methods, operators, iterators ] ) );

    final body =  doBlock( inner );

    return '${ markdown }${ macros }extern class ${ name } ${ body }';

  }

  function doAbstractConstructorBody( name: String, args: Array< String > ) {

    return '{\n    this = ${ doCall( 'new ' + name + 'Data', args ) };\n  }';

  }

  function doAbstractClass( info: ClassInfo ) {

    final abstractClassInfo = new ClassInfo();

    abstractClassInfo.markdownId = info.markdownId;

    abstractClassInfo.macros.values.push( { method: 'forward', args: [] } );

    abstractClassInfo.name = info.name;

    abstractClassInfo.constructor = info.constructor;

    abstractClassInfo.operators = info.operators;

    var abstractString = doClass( abstractClassInfo );

    abstractString = ~/extern class ([^ \n]+)/.replace( abstractString, 'extern abstract $1( $1Data )' );

    if ( info.constructor != null ) {

      final abstractConstructorBody = doAbstractConstructorBody( info.name, info.constructor.args.map( function( arg ) {

        return ~/^\?/.replace( arg.name, '' );

      } ) );

      abstractString = ~/@:selfCall (function new\([^\)]*\));/.replace( abstractString, 'inline $1 ${ abstractConstructorBody }' );

    }


    final dataClassInfo = new ClassInfo();

    dataClassInfo.macros = info.macros.slice( 0 );

    dataClassInfo.name = '${ info.name }Data';

    dataClassInfo.constructor = info.constructor; // TODO: remove markdown from here

    dataClassInfo.properties = info.properties;

    dataClassInfo.methods = info.methods;

    var dataString = doClass( dataClassInfo );


    return doSections( [ abstractString, dataString ] );

  }

  function doTypedef( name: String, type: String ) {

    return 'typedef $name = $type;';

  }

  function doTypedefs( typedefs: Array< { name: String, type: String } > ) {

    return doSections( typedefs.map( def -> doTypedef( def.name, def.type ) ) );

  }

  function doClassFile( info: ClassInfo ) {

    final typedefs = doTypedefs( info.typedefs.values );

    final definition = info.operators.values.length > 0 ? doAbstractClass( info ) : doClass( info );

    final body = doSections( [ typedefs, definition ] );

    return doFile( body );

  }

}
