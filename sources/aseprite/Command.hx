package aseprite;


extern class Command< T > {

  @:selfCall @:native( '__call' ) function call( ?params: T ): Void;

}
