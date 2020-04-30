package aseprite;


extern class Plugin {

  var preferences: Any;
  
  function newCommand( options: { id: String, ?title: String, ?group: String, ?onclick: () -> Void } ): Void;
  
  function deleteCommand( id: EitherType2< String, { id: String } > ): Void;

}
