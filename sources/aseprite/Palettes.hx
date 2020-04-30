package aseprite;


@:forward extern abstract Palettes( PalettesData ) {

  var length( get, never ): Int;
  
  private inline function get_length(): Int {
    return untyped __lua__( "#{0}", this );
  }
  
  @:op( [] ) private inline function __index( index: LuaIndex ): Palette {
    return untyped __lua__( "{0}[{1}]", this, index );
  }
  
  inline function iterator(): Iterator< Palette > {
    return new CollectionIterator< Palette >( this );
  }
  
  inline function keyValueIterator(): KeyValueIterator< Int, Palette > {
    return new CollectionIndexedIterator< Palette >( this );
  }

}

extern class PalettesData {}
