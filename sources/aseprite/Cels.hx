package aseprite;


@:forward extern abstract Cels( CelsData ) {

  var length( get, never ): Int;
  
  private inline function get_length(): Int {
    return untyped __lua__( "#{0}", this );
  }
  
  @:op( [] ) private inline function __index( index: LuaIndex ): Cel {
    return untyped __lua__( "{0}[{1}]", this, index );
  }
  
  inline function iterator(): Iterator< Cel > {
    return new CollectionIterator< Cel >( this );
  }
  
  inline function keyValueIterator(): KeyValueIterator< Int, Cel > {
    return new CollectionIndexedIterator< Cel >( this );
  }

}

extern class CelsData {}
