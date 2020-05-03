package aseprite;


/**
  References a drawing tool. At the moment this class is used only to
  get and set the active tool
  ([`app.activeTool`](https://github.com/aseprite/api/blob/master/api/app.md#appactivetool)), or to paint on the canvas
  (`tool` parameter in [`app.useTool()`](https://github.com/aseprite/api/blob/master/api/app.md#appusetool)).
  
  If a function receives a tool, it can receive a tool ID too.
**/
extern class Tool {

  /**
    ```lua
    local id = app.activeTool.id
    ```
    
    Returns the identifier (a string) of the specified in the
    [`gui.xml`](https://github.com/aseprite/aseprite/blob/master/data/gui.xml)
    file ([example](https://github.com/aseprite/aseprite/blob/20618ff321ae4e73a4f5d6bfd9ef6f2cd8925b7a/data/gui.xml#L1065)).
  **/
  var id( default, null ): String;

}
