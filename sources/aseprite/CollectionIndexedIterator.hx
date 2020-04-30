package aseprite;


class CollectionIndexedIterator< T > {

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

	public inline function next(): { key: Int, value: T } {

		return { key: index, value: untyped __lua__( "{0}[{1}]", collection, ++index ) };

  }

}
