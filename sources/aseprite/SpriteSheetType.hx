package aseprite;


/*
  Type of sprite sheet used in
  [`app.command.ExportSpriteSheet`](https://github.com/aseprite/api/blob/master/api/command/ExportSpriteSheet.md#exportspritesheet).
*/
@:native( "_G.SpriteSheetType" ) extern enum abstract SpriteSheetType( Int ) {

  var HORIZONTAL;
  
  var VERTICAL;
  
  var ROWS;
  
  var COLUMNS;
  
  var PACKED;

}
