package aseprite;


abstract EitherType2< T1, T2 >( Dynamic ) from T1 to T1 from T2 to T2 {}

abstract EitherType3< T1, T2, T3 >( Dynamic ) from T1 to T1 from T2 to T2 from T3 to T3 {}

abstract EitherType4< T1, T2, T3, T4 >( Dynamic ) from T1 to T1 from T2 to T2 from T3 to T3 from T4 to T4 {}

abstract EitherType5< T1, T2, T3, T4, T5 >( Dynamic ) from T1 to T1 from T2 to T2 from T3 to T3 from T4 to T4 from T5 to T5 {}


typedef IntInput = EitherType2< Int, Float >;

typedef FloatInput = EitherType2< Float, Int >;

typedef AnyColorInput = EitherType2< PixelColor, Color >;

typedef PointInput = EitherType3< Point, { x: IntInput, y: IntInput }, LuaArray< IntInput > >;

typedef SizeInput = EitherType3< Size, { width: Int, height: Int }, LuaArray< Int > >;

typedef RectangleInput = EitherType3< Rectangle, { x: IntInput, y: IntInput, width: IntInput, height: IntInput }, LuaArray< IntInput > >;

typedef ToolInput = EitherType2< Tool, String >;


abstract FrameNumberInput( LuaIndex ) from LuaIndex to LuaIndex {

  @:from static inline function fromZeroBased( index: Int ): FrameNumberInput { return ( index: LuaIndex ); }

  @:from static inline function fromFrame( frame: Frame ): FrameNumberInput { return frame.frameNumber; }

}
