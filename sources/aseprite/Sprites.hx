package aseprite;


@:forward extern abstract Sprites( SpritesData ) {

  var length( get, never ): Int;
  
  private inline function get_length(): Int {
    return untyped __lua__( "#{0}", this );
  }
  
  @:op( [] ) private inline function __index( index: LuaIndex ): Sprite {
    return untyped __lua__( "{0}[{1}]", this, index );
  }
  
  inline function iterator(): Iterator< Sprite > {
    return new CollectionIterator< Sprite >( this );
  }
  
  inline function keyValueIterator(): KeyValueIterator< Int, Sprite > {
    return new CollectionIndexedIterator< Sprite >( this );
  }

}

extern class SpritesData {}
