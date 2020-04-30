package aseprite;


extern class Slice {

  var sprite( default, null ): Sprite;
  
  var name: String;
  
  var bounds: Rectangle;
  
  var center: Rectangle;
  
  var pivot: Point;
  
  /*
    ```lua
    local color = slice.color
    slice.color = color
    ```
    
    Gets or sets the user-defined [color](https://github.com/aseprite/api/blob/master/api/color.md#color) of this slice in the timeline.
  */
  var color: Color;
  
  /*
    ```lua
    local data = slice.data
    slice.data = data
    ```
    
    Gets or sets the user-defined data related to this slice (a text string).
  */
  var data: String;

}
