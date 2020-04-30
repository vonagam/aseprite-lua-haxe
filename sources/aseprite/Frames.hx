package aseprite;


@:forward extern abstract Frames( FramesData ) {

  var length( get, never ): Int;
  
  private inline function get_length(): Int {
    return untyped __lua__( "#{0}", this );
  }
  
  @:op( [] ) private inline function __index( index: LuaIndex ): Frame {
    return untyped __lua__( "{0}[{1}]", this, index );
  }
  
  inline function iterator(): Iterator< Frame > {
    return new CollectionIterator< Frame >( this );
  }
  
  inline function keyValueIterator(): KeyValueIterator< Int, Frame > {
    return new CollectionIndexedIterator< Frame >( this );
  }

}

extern class FramesData {}
