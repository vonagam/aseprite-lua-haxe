package aseprite;

import lua.Table;

import lua.PairTools;


@:forward abstract LuaArray< T >( Table< Int, T > ) from Table< Int, T > to Table< Int, T > {

  @:from static inline function fromArray< T >( array: Array< T > ): LuaArray< T > {

    return Table.fromArray( array );

  }

  @:to function toArray(): Array< T > {

    final array = new Array< T >();

    PairTools.ipairsEach( this, function( index, element ) {

      array.push( element );

    } );

    return array;

  }

}
