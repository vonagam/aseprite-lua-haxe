package aseprite;


class CollectionIterator< T > {

  var collection: Any;

	var length: Int;

  var index: Int = 0;


  public inline function new( collection: Any ) {

    this.collection = collection;

    this.length = untyped __lua__( "#{0}", collection );

  }

  public inline function hasNext() {

    return index < length;

	}

	public inline function next(): T {

		return untyped __lua__( "{0}[{1}]", collection, ++index );

  }

}
