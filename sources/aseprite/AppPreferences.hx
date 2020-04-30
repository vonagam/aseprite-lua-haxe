package aseprite;


/*
  ```lua
  local value = app.preferences.section.option
  app.preferences.section.option = newValue
  ```
  
  Gets or sets the given preference `option` in the given `section`. You
  can find valid `section` and `option` names in the
  [pref.xml](https://github.com/aseprite/aseprite/blob/master/data/pref.xml)
  file.
*/
@:forward extern abstract AppPreferences( AppPreferencesData ) {

  @:op( [] ) private inline function __index( section: String ): Dynamic {
    return untyped __lua__( "{0}[{1}]", this, section );
  }

}

extern class AppPreferencesData {

  /*
    ```lua
    local toolPref = app.preferences.tool(tool)
    local value = toolPref.section.option
    toolPref.section.option = newValue
    ```
    
    Returns the preferences of the given [`tool`](https://github.com/aseprite/api/blob/master/api/tool.md#tool).
  */
  @:luaDotMethod function tool( tool: ToolInput ): Dynamic;
  
  /*
    ```lua
    local docPref = app.preferences.document(sprite)
    local value = docPref.section.option
    docPref.section.option = newValue
    ```
    
    Returns the preferences of the given [`sprite`](https://github.com/aseprite/api/blob/master/api/sprite.md#sprite).
  */
  @:luaDotMethod function document( ?sprite: Sprite ): Dynamic;

}
