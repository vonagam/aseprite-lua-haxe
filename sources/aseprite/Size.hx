package aseprite;


/*
  If a function receives a size as an argument it could be several things:
  
  1. You can specify two parameters `width, height` directly as
     arguments of the function.
     E.g. `sprite:resize(64, 32)`
  1. You can specify an object with `width` and `height` properties.
     E.g. `sprite:resize{ width=64, height=32 }`
  1. You can specify an array two elements:
     E.g. `sprite:resize{ 64, 32 }`
  1. You can specify a `Size` instance:
     E.g. `sprite:resize(Size(64, 32))`
*/
@:forward extern abstract Size( SizeData ) {

  /*
    ```lua
    Size()
    Size(otherSize)
    Size(width, height)
    Size{width=number, height=number}
    Size{number, number}
    ```
    
    Creates a new `Size` instance with the given dimensions (or
    `width=height=0` if they are not specified).
  */
  inline function new( options: SizeInput ) {
    this = new SizeData( options );
  }
  
  @:op( -a ) private inline function __unm(): Size {
    return untyped __lua__( "-{0}", this );
  }
  
  @:op( a + b ) private inline function __add( value: EitherType2< Size, Int > ): Size {
    return untyped __lua__( "{0} + {1}", this, value );
  }
  
  @:op( a - b ) private inline function __sub( value: EitherType2< Size, Int > ): Size {
    return untyped __lua__( "{0} - {1}", this, value );
  }
  
  @:op( a * b ) private inline function __mul( value: Int ): Size {
    return untyped __lua__( "{0} * {1}", this, value );
  }
  
  @:op( a / b ) private inline function __div( value: Int ): Size {
    return untyped __lua__( "{0} / {1}", this, value );
  }
  
  @:op( a % b ) private inline function __mod( value: Int ): Size {
    return untyped __lua__( "{0} % {1}", this, value );
  }
  
  @:op( a ^ b ) private inline function __pow( value: Int ): Size {
    return untyped __lua__( "{0} ^ {1}", this, value );
  }

}

@:native( "_G.Size" ) extern class SizeData {

  /*
    ```lua
    local width = size.width
    size.width = newWidth
    ```
  */
  var width: Int;
  
  /*
    ```lua
    local height = size.height
    size.height = newHeight
    ```
  */
  var height: Int;
  
  /*
    ```lua
    Size()
    Size(otherSize)
    Size(width, height)
    Size{width=number, height=number}
    Size{number, number}
    ```
    
    Creates a new `Size` instance with the given dimensions (or
    `width=height=0` if they are not specified).
  */
  @:selfCall function new( options: SizeInput );

}
