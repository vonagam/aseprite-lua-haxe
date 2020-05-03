package aseprite;


/**
  Data format used to export JSON files in
  [`app.command.ExportSpriteSheet`](https://github.com/aseprite/api/blob/master/api/command/ExportSpriteSheet.md#exportspritesheet).
**/
@:native( "_G.SpriteSheetDataFormat" ) extern enum abstract SpriteSheetDataFormat( Int ) {

  var JSON_HASH;
  
  var JSON_ARRAY;

}
