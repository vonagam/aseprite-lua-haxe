package aseprite;


/*
  If a function receives a rectangle as an argument it could be several
  things:
  
  1. You can specify the parameters `x, y, width, height` directly as
     arguments of the function.
     E.g. `sprite:crop(0, 16, 64, 32)`
  1. You can specify an object with `x`, `y`, `width`, and `height` properties.
     E.g. `sprite:crop{ x=0, y=16, width=64, height=32 }`
  1. You can specify an array with 4 elements:
     E.g. `sprite:crop{ 0, 16, 64, 32 }`
  1. You can specify a `Rectangle` instance:
     E.g. `sprite:crop(Rectangle(0, 16, 64, 32))`
*/
@:forward extern abstract Rectangle( RectangleData ) {

  /*
    ```lua
    Rectangle()
    Rectangle(otherRectangle)
    Rectangle(x, y, width, height)
    Rectangle{x=number, y=number, width=number, height=number}
    Rectangle{number, number, number, number}
    ```
  */
  inline function new( options: RectangleInput ) {
    this = new RectangleData( options );
  }
  
  @:op( a & b ) private inline function __band( value: Rectangle ): Rectangle {
    return untyped __lua__( "{0} & {1}", this, value );
  }
  
  @:op( a | b ) private inline function __bor( value: Rectangle ): Rectangle {
    return untyped __lua__( "{0} | {1}", this, value );
  }

}

@:native( "_G.Rectangle" ) extern class RectangleData {

  /*
    ```lua
    local x = rectangle.x
    rectangle.x = newX
    ```
    
    Gets or sets the *x*-coordinate of the rectangle. 0 means at the left
    side of the screen/sprite.
  */
  var x: Int;
  
  /*
    ```lua
    local y = rectangle.y
    rectangle.y = newY
    ```
    
    Gets or sets the *y*-coordinate of the rectangle. 0 means at the top side
    of the screen/sprite.
  */
  var y: Int;
  
  /*
    ```lua
    local width = rectangle.width
    rectangle.width = newWidth
    ```
    
    Gets or sets the *width* of the rectangle. If it's 0, the rectangle is
    empty (so the coordinate doesn't matter).
  */
  var width: Int;
  
  /*
    ```lua
    local height = rectangle.height
    rectangle.height = newHeight
    ```
    
    Gets or sets the *height* of the rectangle. If it's 0, the rectangle is
    empty (so the coordinate doesn't matter).
  */
  var height: Int;
  
  /*
    ```lua
    local booleanResult = rectangle.isEmpty
    ```
    
    Returns true if the rectangle is empty i.e. [width](https://github.com/aseprite/api/blob/master/api/rectangle.md#rectanglewidth)
    and/or [height](https://github.com/aseprite/api/blob/master/api/rectangle.md#rectangleheight) are 0.
  */
  var isEmpty( default, null ): Bool;
  
  /*
    ```lua
    Rectangle()
    Rectangle(otherRectangle)
    Rectangle(x, y, width, height)
    Rectangle{x=number, y=number, width=number, height=number}
    Rectangle{number, number, number, number}
    ```
  */
  @:selfCall function new( options: RectangleInput );
  
  /*
    ```lua
    local booleanResult = rectangle:contains(otherRectangle)
    ```
    
    Returns true if `otherRectangle` is inside `rectangle`.
    
    Example:
    
    ```lua
    local bounds = Rectangle{ x=0, y=0, width=32, height=32 }
    local rectInside = Rectangle{ x=4, y=4, width=8, height=8 }
    if bounds:contains(rectInside) then ... end
    ```
  */
  function contains( rectangle: Rectangle ): Bool;
  
  /*
    ```lua
    local booleanResult = rectangle:intersects(otherRectangle)
    ```
    
    Returns true if `rectangle` intersects in some way `otherRectangle`.
  */
  function intersects( rectangle: Rectangle ): Bool;
  
  /*
    ```lua
    local newRectangle = rectangle:union(otherRectangle)
    ```
    
    Returns the new rectangle `newRectangle` which will be a rectangle big
    enough to contains both given rectangles `rectangle` and
    `otherRectangle`.
  */
  function union( rectangle: Rectangle ): Rectangle;
  
  /*
    ```lua
    local newRectangle = rectangle:intersect(otherRectangle)
    ```
    
    Returns the new rectangle `newRectangle` which is the intersection of
    `rectangle` and `otherRectangle`. If both rectangles don't intersect each other, the result will be an [empty rectangle](https://github.com/aseprite/api/blob/master/api/rectangle.md#rectangleisempty)
  */
  function intersect( rectangle: Rectangle ): Rectangle;

}
