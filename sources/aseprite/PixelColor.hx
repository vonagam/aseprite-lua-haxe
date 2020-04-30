package aseprite;


abstract PixelColor( Int ) from Int to Int {

  public var r( get, set ): Int;

  public var g( get, set ): Int;

  public var b( get, set ): Int;

  public var a( get, set ): Int;

  public var grayV( get, set ): Int;

  public var grayA( get, set ): Int;


  public inline function new( ?value: Int ) {

    this = value == null ? 0 : value;

  }


  inline function get_r() return Colors().rgbaR( this );

  inline function set_r( value: Int ) return this = Colors().rgba( value, g, b, a );

  inline function get_g() return Colors().rgbaG( this );

  inline function set_g( value: Int ) return this = Colors().rgba( r, value, b, a );

  inline function get_b() return Colors().rgbaB( this );

  inline function set_b( value: Int ) return this = Colors().rgba( r, g, value, a );

  inline function get_a() return Colors().rgbaA( this );

  inline function set_a( value: Int ) return this = Colors().rgba( r, g, b, value );

  inline function get_grayV() return Colors().grayaV( this );

  inline function set_grayV( value: Int ) return this = Colors().graya( value, grayA );

  inline function get_grayA() return Colors().grayaA( this );

  inline function set_grayA( value: Int ) return this = Colors().graya( grayV, value );


  static public inline function fromPixelColor( value: Int ) {

    return new PixelColor( value );

  }

  public inline function toPixelColor() {

    return this;

  }

  @:from static public inline function fromColor( value: Color ) {

    return value.rgbaPixel;

  }

  @:to public inline function toColor() {

    return new Color( this );

  }

  public function toRGBAColor() {

    return new Color( { r: r, g: g, b: b, a: a } );

  }

  public function toGrayColor() {

    return new Color( { gray: grayV, alpha: grayA } );

  }

  @:from static public function fromRGBA( value: { r: Int, g: Int, b: Int, ?a: Int } ) {

    return Colors().rgba( value.r, value.g, value.b, value.a );

  }

  @:from static public function fromGrayA( value: { v: Int, ?a: Int } ) {

    return Colors().graya( value.v, value.a );

  }

  @:from static public function fromRGBAColor( value: { rgba: Color } ) {

    return value.rgba.rgbaPixel;

  }

  @:from static public function fromGrayColor( value: { gray: Color } ) {

    return value.gray.grayPixel;

  }


  static inline function Colors() {

    return Aseprite.app.pixelColor;

  }

}
