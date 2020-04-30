package aseprite;


@:forward extern abstract Layers( LayersData ) {

  var length( get, never ): Int;
  
  private inline function get_length(): Int {
    return untyped __lua__( "#{0}", this );
  }
  
  @:op( [] ) private inline function __index( index: LuaIndex ): Layer {
    return untyped __lua__( "{0}[{1}]", this, index );
  }
  
  inline function iterator(): Iterator< Layer > {
    return new CollectionIterator< Layer >( this );
  }
  
  inline function keyValueIterator(): KeyValueIterator< Int, Layer > {
    return new CollectionIndexedIterator< Layer >( this );
  }

}

extern class LayersData {}
