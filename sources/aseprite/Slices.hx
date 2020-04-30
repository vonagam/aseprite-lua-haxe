package aseprite;


@:forward extern abstract Slices( SlicesData ) {

  var length( get, never ): Int;
  
  private inline function get_length(): Int {
    return untyped __lua__( "#{0}", this );
  }
  
  @:op( [] ) private inline function __index( index: LuaIndex ): Slice {
    return untyped __lua__( "{0}[{1}]", this, index );
  }
  
  inline function iterator(): Iterator< Slice > {
    return new CollectionIterator< Slice >( this );
  }
  
  inline function keyValueIterator(): KeyValueIterator< Int, Slice > {
    return new CollectionIndexedIterator< Slice >( this );
  }

}

extern class SlicesData {}
