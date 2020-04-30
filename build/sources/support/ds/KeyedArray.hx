package support.ds;

using Lambda;


class KeyedArray< K, T > {

  public var values( default, null ): Array< T > = [];

  public var keyer( default, null ): ( item: T ) -> K;


  public function new( keyer: ( item: T ) -> K ) {

    this.keyer = keyer;

  }


  public function iterator() {

    return values.iterator();

  }

  public function exists( key: K ) {

    return values.exists( ( item ) -> keyer( item ) == key );

  }

  public function get( key: K ) {

    return values.find( ( item ) -> keyer( item ) == key );

  }

  public function remove( key: K ) {

    var index = values.length;

    while ( index-- > 0 ) {

      if ( keyer( values[ index ] ) == key ) {

        values.splice( index, 1 );

      }

    }

  }

  public function slice( position: Int, ?end: Int ) {

    final copy = new KeyedArray< K, T >( this.keyer );

    copy.values = values.slice( position, end );

    return copy;

  }

}
