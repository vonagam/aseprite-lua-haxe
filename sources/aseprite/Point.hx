package aseprite;


/*
  If a function receives a point as an argument it could be several things:
  
  1. You can specify two parameters `x, y` directly as arguments of the
     function.  E.g. `selection:contains(8, 20)`
  1. You can specify an object with `x` and `y` properties.
     E.g. `selection:contains{ x=8, y=20 }`
  1. You can specify an array with two elements:
     E.g. `selection:contains{ 8, 20 }`
  1. You can specify a `Point` instance:
     E.g. `selection:contains(Point(8, 20))`
*/
@:forward extern abstract Point( PointData ) {

  /*
    ```lua
    Point()
    Point(otherPoint)
    Point(x, y)
    Point{x=number, y=number}
    Point{number, number}
    ```
    
    Creates a new `Point` instance with the given coordinates (or `x=y=0`
    if they are not specified).
  */
  inline function new( options: PointInput ) {
    this = new PointData( options );
  }
  
  @:op( -a ) private inline function __unm(): Point {
    return untyped __lua__( "-{0}", this );
  }
  
  @:op( a + b ) private inline function __add( value: EitherType2< Point, Int > ): Point {
    return untyped __lua__( "{0} + {1}", this, value );
  }
  
  @:op( a - b ) private inline function __sub( value: EitherType2< Point, Int > ): Point {
    return untyped __lua__( "{0} - {1}", this, value );
  }
  
  @:op( a * b ) private inline function __mul( value: Int ): Point {
    return untyped __lua__( "{0} * {1}", this, value );
  }
  
  @:op( a / b ) private inline function __div( value: Int ): Point {
    return untyped __lua__( "{0} / {1}", this, value );
  }
  
  @:op( a % b ) private inline function __mod( value: Int ): Point {
    return untyped __lua__( "{0} % {1}", this, value );
  }
  
  @:op( a ^ b ) private inline function __pow( value: Int ): Point {
    return untyped __lua__( "{0} ^ {1}", this, value );
  }

}

@:native( "_G.Point" ) extern class PointData {

  /*
    ```lua
    local x = point.x
    point.x = newX
    ```
  */
  var x: Int;
  
  /*
    ```lua
    local y = point.y
    point.y = newY
    ```
  */
  var y: Int;
  
  /*
    ```lua
    Point()
    Point(otherPoint)
    Point(x, y)
    Point{x=number, y=number}
    Point{number, number}
    ```
    
    Creates a new `Point` instance with the given coordinates (or `x=y=0`
    if they are not specified).
  */
  @:selfCall function new( options: PointInput );

}
