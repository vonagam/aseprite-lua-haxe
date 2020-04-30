package support.io;

import haxe.io.Path;

import sys.FileSystem;

import sys.io.File;


class Files {

  public static function collect( path: String, extension: String ) {

    var names = FileSystem.readDirectory( path );

    names = names.filter( ( asd ) -> Path.extension( asd ) == extension );

    final files = [ for ( name in names ) name => File.getContent( Path.addTrailingSlash( path ) + name ) ];

    return files;

  }

  public static function output( name: String, content: String ) {

    File.saveContent( './outputs/$name.hx', content );

  }

  public static function transfer( source: String, destination: String ) {

    for ( name in FileSystem.readDirectory( source ) ) {

      final sourcePath = Path.join( [ source, name ] );

      final destinationPath = Path.join( [ destination, name ] );

      if ( FileSystem.isDirectory( sourcePath ) ) continue;

      File.copy( sourcePath, destinationPath );

    }

  }

}
