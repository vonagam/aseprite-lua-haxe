package data;

import support.ds.KeyedArray;


typedef StringedArray< T > = KeyedArray< String, T >;


class ClassConstructorInfo {

  public var markdownId = '';

  public var macros = new StringedArray< { method: String, args: Array< String > } >( ( item ) -> item.method );

  public var hints = new Array< String >();

  public var args = new Array< { name: String, type: String } >();

  public var overloads = new Array< { args: Array< { name: String, type: String } > } >();


  public function new( ?setup: ( info: ClassConstructorInfo ) -> Void ) {

    if ( setup != null ) setup( this );

  }

}

class ClassPropertyInfo {

  public var markdownId = '';

  public var macros = new StringedArray< { method: String, args: Array< String > } >( ( item ) -> item.method );

  public var name = '';

  public var hints = new Array< String >();

  public var type = '';

  public var accessors = [ 'default', 'default' ];


  public function new( ?setup: ( info: ClassPropertyInfo ) -> Void ) {

    if ( setup != null ) setup( this );

  }

}

class ClassMethodInfo {

  public var markdownId = '';

  public var macros = new StringedArray< { method: String, args: Array< String > } >( ( item ) -> item.method );

  public var name = '';

  public var hints = new Array< String >();

  public var type = '';

  public var args = new Array< { name: String, type: String } >();

  public var overloads = new Array< { args: Array< { name: String, type: String } >, type: String } >();


  public function new( ?setup: ( info: ClassMethodInfo ) -> Void ) {

    if ( setup != null ) setup( this );

  }

}

class ClassOperatorInfo {

  public var markdownId = '';

  public var macros = new StringedArray< { method: String, args: Array< String > } >( ( item ) -> item.method );

  public var name = '';

  public var hints = new Array< String >();

  public var type = '';

  public var args = new Array< { name: String, type: String } >();

  public var op = '';

  public var lua = '';


  public function new( ?setup: ( info: ClassOperatorInfo ) -> Void ) {

    if ( setup != null ) setup( this );

  }

}

class ClassInfo {

  public var markdownId = '';

  public var macros = new StringedArray< { method: String, args: Array< String > } >( ( item ) -> item.method );

  public var name = '';

  public var constructor: Null< ClassConstructorInfo >;

  public var properties = new StringedArray< ClassPropertyInfo >( ( item ) -> item.name );

  public var methods = new StringedArray< ClassMethodInfo >( ( item ) -> item.name );

  public var operators = new StringedArray< ClassOperatorInfo >( ( item ) -> item.name );

  public var typedefs = new StringedArray< { name: String, type: String } >( ( item ) -> item.name );


  public function new( ?setup: ( info: ClassInfo ) -> Void ) {

    if ( setup != null ) setup( this );

  }

}

class EnumInfo {

  public var markdownId = '';

  public var macros = new StringedArray< { method: String, args: Array< String > } >( ( item ) -> item.method );

  public var name = '';

  public var values = new Array< String >();


  public function new( ?setup: ( info: EnumInfo ) -> Void ) {

    if ( setup != null ) setup( this );

  }

}

class CommandInfo {

  public var markdownId = '';

  public var name = '';

  public var params = new Array< { name: String, type: String } >();


  public function new( ?setup: ( info: CommandInfo ) -> Void ) {

    if ( setup != null ) setup( this );

  }

}
