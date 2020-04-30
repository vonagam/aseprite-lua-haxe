package aseprite;


@:forward extern abstract Images( ImagesData ) {

  var length( get, never ): Int;
  
  private inline function get_length(): Int {
    return untyped __lua__( "#{0}", this );
  }
  
  @:op( [] ) private inline function __index( index: LuaIndex ): Image {
    return untyped __lua__( "{0}[{1}]", this, index );
  }
  
  inline function iterator(): Iterator< Image > {
    return new CollectionIterator< Image >( this );
  }
  
  inline function keyValueIterator(): KeyValueIterator< Int, Image > {
    return new CollectionIndexedIterator< Image >( this );
  }

}

extern class ImagesData {}
