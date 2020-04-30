package aseprite;


@:forward extern abstract Tags( TagsData ) {

  var length( get, never ): Int;
  
  private inline function get_length(): Int {
    return untyped __lua__( "#{0}", this );
  }
  
  @:op( [] ) private inline function __index( index: LuaIndex ): Tag {
    return untyped __lua__( "{0}[{1}]", this, index );
  }
  
  inline function iterator(): Iterator< Tag > {
    return new CollectionIterator< Tag >( this );
  }
  
  inline function keyValueIterator(): KeyValueIterator< Int, Tag > {
    return new CollectionIndexedIterator< Tag >( this );
  }

}

extern class TagsData {}
