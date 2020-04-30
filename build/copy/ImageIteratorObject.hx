package aseprite;


extern class ImageIteratorObject {

  var x( default, null ): Int;

  var y( default, null ): Int;


  @:overload( function( color: PixelColor ): PixelColor {} )

  @:selfCall @:native( '__call' ) function call(): PixelColor;

}
