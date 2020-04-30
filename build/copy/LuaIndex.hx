package aseprite;


abstract LuaIndex( Int ) {

  inline function new( value: Int ) {

    this = value;

  }


  @:from static inline function fromZeroBased( index: Int ) {

    return new LuaIndex( index + 1 );

  }

  @:to inline function toZeroBased() {

    return this - 1;

  }

}
