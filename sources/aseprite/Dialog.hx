package aseprite;


typedef DialogWidgetOptions = { ?id: String, ?label: String, ?focus: Boolean };

typedef DialogTextWidgetOptions = DialogWidgetOptions & { ?text: String };

typedef DialogButtonWidgetOptions = DialogTextWidgetOptions & { ?onclick: () -> Void, ?selected: Boolean };

/*
  The dialog class can be used to show input controls/widgets in the
  screen to get some data from the user.
  
  Example:
  
  ```lua
  local dlg = Dialog()
  dlg:entry{ id="user_value", label="User Value:", text="Default User" }
  dlg:button{ id="ok", text="OK" }
  dlg:button{ id="cancel", text="Cancel" }
  dlg:show()
  local data = dlg.data
  if data.ok then
    app.alert("The given value is '" .. data.user_value .. "'")
  end
  ```
  
  Almost all dialogs functions return the same dialog object so we can
  use [method chaining](https://en.wikipedia.org/wiki/Method_chaining).
  For example:
  
  ```lua
  local data =
    Dialog():entry{ id="user_value", label="User Value:", text="Default User" }
            :button{ id="ok", text="OK" }
            :button{ id="cancel", text="Cancel" }
            :show().data
  if data.ok then
    app.alert("The given value is '" .. data.user_value .. "'")
  end
  ```
*/
@:native( "_G.Dialog" ) extern class Dialog {

  /*
    ```lua
    local dlg = Dialog()
    local data = dlg.data
    dlg.data = data
    ```
    
    Gets/sets a table with one field for each widget with a given `id`.
    For each different kind of widget the field is of a different type:
    
    * [button](https://github.com/aseprite/api/blob/master/api/dialog.md#dialogbutton)/[check](https://github.com/aseprite/api/blob/master/api/dialog.md#dialogcheck)/[radio](https://github.com/aseprite/api/blob/master/api/dialog.md#dialogradio):
      The field is a boolean (true or
      false) if the button is selected or was used to close the dialog.
    * [entry](https://github.com/aseprite/api/blob/master/api/dialog.md#dialogentry)/[label](https://github.com/aseprite/api/blob/master/api/dialog.md#dialoglabel): A string of text.
    * [slider](https://github.com/aseprite/api/blob/master/api/dialog.md#dialogslider): An integer.
    * [number](https://github.com/aseprite/api/blob/master/api/dialog.md#dialognumber): An intenger or a
      number depending on the number of decimals of the number field.
    * [combobox](https://github.com/aseprite/api/blob/master/api/dialog.md#dialogcombobox): A string with the
      selected item.
    * [color](https://github.com/aseprite/api/blob/master/api/dialog.md#dialogcolor): A [Color](https://github.com/aseprite/api/blob/master/api/color.md#color).
    * [shades](https://github.com/aseprite/api/blob/master/api/dialog.md#dialogshades): A table with an array of [Color](https://github.com/aseprite/api/blob/master/api/color.md#color)s when `mode="sort"`
  */
  var data: Any;
  
  /*
    ```lua
    local dlg = Dialog()
    local bounds = dlg.bounds
    dlg.bounds = Rectangle(x, y, bounds.width, bounds.height)
    ```
    
    Gets or sets the position and size (a [rectangle](https://github.com/aseprite/api/blob/master/api/rectangle.md#rectangle)) of
    the dialog. This might be useful to align several dialog that must be
    shown in the same *xy*-position.
  */
  var bounds: Rectangle;
  
  /*
    ```lua
    local dlg = Dialog()
    local dlg = Dialog(string)
    local dlg = Dialog{ title=string,
                        onclose=function }
    ```
    
    Creates a new dialog. The dialog is hidden, so you have to call
    [Dialog:show](https://github.com/aseprite/api/blob/master/api/dialog.md#dialogshow) function to make it visible. The
    constructor that receives a `string` will use that string in the title
    bar of the dialog. The constructor that receives a table can receive a
    special callback function (`onclose`) that is called when the dialog
    is closed.
  */
  @:selfCall function new( options: EitherType2< String, { ?title: String, ?onclose: () -> Void } > );
  
  /*
    ```lua
    local dlg = Dialog()
    dlg:show()
    dlg:show{
      wait=false,
      bounds=Rectangle()
    }
    ```
    
    Makes the dialog visible to the user. The script code will continue
    when the dialog is closed by default (pressing a
    [button](https://github.com/aseprite/api/blob/master/api/dialog.md#dialogbutton)).
    
    If `{ wait=false }` is used as argument, the dialog is open "in
    background", which means that the script code continues the execution
    with its following line, and the dialog will be visible until it's
    closed with some button or calling [Dialog:close](https://github.com/aseprite/api/blob/master/api/dialog.md#dialogclose) in a
    `onclick` event.
    
    With `{ bounds=Rectangle() }` you can display the dialog in a specific
    location. Useful to show the dialog in a previous position that you
    obtain from [Dialog.bounds](https://github.com/aseprite/api/blob/master/api/dialog.md#dialogbounds) property.
  */
  function show( ?options: { ?wait: Bool, ?bounds: RectangleInput } ): Void;
  
  /*
    ```lua
    local dlg = Dialog()
    dlg:button{ text="Close",
                onclick=function()
                          dlg:close()
                        end }
    dlg:show{ wait=false }
    ```
    
    Closes the dialog from a `onclick` [button](https://github.com/aseprite/api/blob/master/api/dialog.md#dialogbutton) event. By
    default buttons without an `onclick` event handler will close the
    dialog, but if you specify a `onclick` function, you have to call this
    function to close the dialog.
  */
  function close(): Void;
  
  /*
    ```lua
    local dlg = Dialog()
    dlg:newrow()
    dlg:newrow{ always }
    ```
    
    Indicates that the next widget should be put in a new row in the
    dialog (useful to create buttons or several controls of the same type
    one below the other).
    
    Using the `newrow{ always }` is a way to avoid joining widgets of the
    same type (it's like calling `newrow()` after new widget is added).
  */
  function newrow( ?options: { ?always: Bool } ): Void;
  
  /*
    ```lua
    local dlg = Dialog()
    dlg:separator{ id=string,
                   label=string,
                   text=string }
    ```
  */
  function separator( ?options: EitherType2< String, { ?text: String } > ): Void;
  
  /*
    ```lua
    local dlg = Dialog()
    dlg:label{ id=string,
               label=string,
               text=string }
    ```
    
    * `id`: Identifier for this label. If you specify it, a field in
      [Dialog.data](https://github.com/aseprite/api/blob/master/api/dialog.md#dialogdata) will be created with the given string in
      `text`.
    * `label`: Text to be used in the left side.
    * `text`: Text to be used in the right side.
    
    Creates a static label.
  */
  function label( options: DialogTextWidgetOptions ): Void;
  
  /*
    ```lua
    local dlg = Dialog()
    dlg:button{ id=string,
                label=string,
                text=string,
                selected=boolean,
                focus=boolean,
                onclick=function }
    ```
    
    Creates a button.
    
    Arguments (table fields):
    
    * `id`: Identifier for this button. [Dialog.data](https://github.com/aseprite/api/blob/master/api/dialog.md#dialogdata) will contain a field
      for each widget with and `id`.
    * `label`: Label at the left side of the control.
    * `text`: Text of the button.
    * `selected`: True in case that you want to show the button checked by default.
    * `focus`: Focus this button by default or when the Enter key is pressed in an [text entry](https://github.com/aseprite/api/blob/master/api/dialog.md#dialogentry) field.
    * `onclick`: Function to be called when the button is pressed.
  */
  function button( options: DialogButtonWidgetOptions ): Void;
  
  /*
    ```lua
    local dlg = Dialog()
    dlg:check{ id=string,
               label=string,
               text=string,
               selected=boolean,
               onclick=function }
    ```
    
    Creates a check box. Arguments are the same as in [Dialog:button](https://github.com/aseprite/api/blob/master/api/dialog.md#dialogbutton).
  */
  function check( options: DialogButtonWidgetOptions ): Void;
  
  /*
    ```lua
    local dlg = Dialog()
    dlg:radio{ id=string,
               label=string,
               text=string,
               selected=boolean,
               onclick=function }
    ```
    
    Creates a radio button. Arguments are the same as in [Dialog:button](https://github.com/aseprite/api/blob/master/api/dialog.md#dialogbutton).
  */
  function radio( options: DialogButtonWidgetOptions ): Void;
  
  /*
    ```lua
    local dlg = Dialog()
    dlg:entry{ id=string,
               label=string,
               text=string,
               focus=boolean }
    ```
    
    Creates a text entry.
  */
  function entry( options: DialogTextWidgetOptions ): Void;
  
  /*
    ```lua
    local dlg = Dialog()
    dlg:number{ id=string,
                label=string,
                text=string,
                decimals=integer }
    ```
    
    Creates an entry field to input a number.
  */
  function number( options: DialogTextWidgetOptions & { ?decimals: Int } ): Void;
  
  /*
    ```lua
    local dlg = Dialog()
    dlg:slider{ id=string,
                label=string,
                min=integer,
                max=integer,
                value=integer }
    ```
    
    Creates a slider in the dialog.
  */
  function slider( options: DialogWidgetOptions & { ?min: Int, ?max: Int, ?value: Int } ): Void;
  
  /*
    ```lua
    local dlg = Dialog()
    dlg:combobox{ id=string,
                  label=string,
                  option=string,
                  options={ string1,string2,string3... } }
    ```
    
    Creates a combo box/drop-down list.
  */
  function combobox( options: DialogWidgetOptions & { options: LuaArray< String >, ?option: String } ): Void;
  
  /*
    ```lua
    local dlg = Dialog()
    dlg:color{ id=string,
               label=string,
               color=app.Color }
    ```
    
    Creates a button to select a [color](https://github.com/aseprite/api/blob/master/api/color.md#color).
  */
  function color( options: DialogWidgetOptions & { ?color: Color, ?onchange: ( { ?color: Color } ) -> Void } ): Void;
  
  /*
    ```lua
    local dlg = Dialog()
    dlg:shades{ id=string,
                label=string,
                mode="pick" | "sort",
                colors={ color1, color2, color3, ... },
                onclick=function }
    ```
    
    Creates a widget with a set of colors that can be clicked/picked (when
    `mode="pick"`, which is the default mode) or can be sorted (when
    `mode="sort"`, which is the default mode).
    
    The `onclick` function can receive a `event` parameter which is a
    table with one `event.color` field which is the color that was
    clicked, and a `event.button` field with the
    [mouse button](https://github.com/aseprite/api/blob/master/api/mousebutton.md#mousebutton), for example:
    
    ```lua
    dlg:shades{
      ...
      onclick=function(ev)
        if ev.button == MouseButton.LEFT then
          -- In this case we change the active foreground color
          -- with the clicked color in the shades widget when
          -- the left mouse button is pressed.
          app.fgColor = ev.color
        elseif ev.button == MouseButton.RIGHT then
          app.bgColor = ev.color
        end
      end
    }
    ```
  */
  function shades( options: DialogWidgetOptions & { colors: LuaArray< Color >, ?mode: String, ?onclick: ( { button: MouseButton, ?color: Color } ) -> Void } ): Void;
  
  /*
    ```lua
    local dlg = Dialog()
    dlg:file{ id=string,
              label=string,
              title=string,
              open=boolean,
              save=boolean,
              filename=string | { string1,string2,string3... },
              filetypes={ string1,string2,string3... },
              onchange=function }
    ```
    
    Creates a text entry field + a button to select one file to open or save, possibilities:
    
    * `open=true`: shows a dialog to open an existent file (this is the default mode).
    * `save=true`: shows a dialog to select an existent file to overwrite or a new file to save.
    
    Arguments (table fields):
    
    * `load`: True if you want to show a dialog to the user to select an existent file to load/read.
    * `save`: True if you want to show a dialog to the user to select a new file to save/write content.
    * `filename`: String of the selected filename to open or save.
    * `filetypes`: Array of possible file types/extensions that the user can select.
    * `entry`: Show an entry field to edit the filename manually (false by default).
    * `focus`: Focus this field by default.
    * `onchange`: Function to be called when the filename is changed.
  */
  function file( options: DialogWidgetOptions & { ?filename: String, ?save: Bool, ?title: String, ?entry: Bool, ?filetypes: LuaArray< String >, ?onchange: () -> Void } ): Void;
  
  /*
    ```lua
    local dlg = Dialog()
    dlg:modify{ id=string,
                visible=boolean,
                enabled=boolean,
                text=string }
    ```
    
    Changes properties of the given widget that matches the identifier `id`.
  */
  function modify( options: { ?id: String, ?enabled: Bool, ?selected: Bool, ?visible: Bool, ?text: String, ?label: String, ?focus: Bool } ): Void;

}
