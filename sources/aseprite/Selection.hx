package aseprite;


@:native( "_G.Selection" ) extern class Selection {

  /**
    ```lua
    local rectangle = selection.bounds
    ```
    
    Returns a [rectangle](https://github.com/aseprite/api/blob/master/api/rectangle.md#rectangle) with the bounds of the selection
    (if the rectangle is empty, is because there is no selection).
  **/
  var bounds( default, null ): Rectangle;
  
  /**
    ```lua
    local point = selection.origin
    selection.origin = newPoint
    ```
    
    Gets or sets the selection origin/position (a [point](https://github.com/aseprite/api/blob/master/api/point.md#point)).
    This can be used to move the selection edges (not the content).
  **/
  var origin: Point;
  
  /**
    ```lua
    local status = selection.isEmpty
    ```
    
    Returns true if the selection is empty i.e. there are no pixels
    selected.
  **/
  var isEmpty( default, null ): Bool;
  
  /**
    ```lua
    Selection()
    Selection(rectangle)
    ```
    
    Creates a new empty selection, or with the given [rectangle](https://github.com/aseprite/api/blob/master/api/rectangle.md#rectangle).
  **/
  @:selfCall function new( ?selection: RectangleInput );
  
  /**
    ```lua
    selection:deselect()
    ```
  **/
  function deselect(): Void;
  
  /**
    ```lua
    selection:select(rectangle)
    ```
    
    Selects the given [rectangle](https://github.com/aseprite/api/blob/master/api/rectangle.md#rectangle).
  **/
  @:overload( function( rectangle: RectangleInput ): Void {} )
  function select( selection: Selection ): Void;
  
  /**
    ```lua
    selection:selectAll()
    ```
    
    Selected the whole sprite canvas. Only valid for a
    [sprite.selection](https://github.com/aseprite/api/blob/master/api/sprite.md#spriteselection).
  **/
  function selectAll(): Void;
  
  @:overload( function( rectangle: RectangleInput ): Void {} )
  function add( selection: Selection ): Void;
  
  @:overload( function( rectangle: RectangleInput ): Void {} )
  function subtract( selection: Selection ): Void;
  
  @:overload( function( rectangle: RectangleInput ): Void {} )
  function intersect( selection: Selection ): Void;
  
  /**
    ```lua
    local status = selection:contains(point)
    local status = selection:contains(x, y)
    ```
    
    Returns true or false if the given [point](https://github.com/aseprite/api/blob/master/api/point.md#point) is inside the
    selection.
  **/
  function contains( point: PointInput ): Bool;

}
