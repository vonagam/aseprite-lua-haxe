package aseprite;


/*
  Represents a version number and provides an easy way to compare if the
  [`app.version`](https://github.com/aseprite/api/blob/master/api/app.md#appversion) is greater or equal than a specific
  expected version. Example:
  
  ```lua
  if app.version >= Version("1.2.10-beta4") then
    ...
  end
  ```
*/
@:forward extern abstract Version( VersionData ) {

  /*
    ```lua
    local v = Version("1.2.10")
    ```
    
    You can create a new version from a string. Then access each field
  */
  inline function new( ?version: EitherType2< Version, String > ) {
    this = new VersionData( version );
  }
  
  @:op( a < b ) private inline function __lt( value: Version ): Bool {
    return untyped __lua__( "{0} < {1}", this, value );
  }
  
  @:op( a <= b ) private inline function __le( value: Version ): Bool {
    return untyped __lua__( "{0} <= {1}", this, value );
  }
  
  @:op( a > b ) private inline function __gt( value: Version ): Bool {
    return untyped __lua__( "{0} > {1}", this, value );
  }
  
  @:op( a >= b ) private inline function __ge( value: Version ): Bool {
    return untyped __lua__( "{0} >= {1}", this, value );
  }

}

@:native( "_G.Version" ) extern class VersionData {

  /*
    ```lua
    local v = Version("1.2.9")
    assert(v.major == 1)
    
    v = Version("2")
    assert(v.major == 2)
    ```
    
    Returns the first number of the version.
  */
  var major( default, null ): Int;
  
  /*
    ```lua
    local v = Version("1.2.9")
    assert(v.minor == 2)
    
    v = Version("2")
    assert(v.minor == 0)
    ```
    
    Returns the second number of the version.
  */
  var minor( default, null ): Int;
  
  /*
    ```lua
    local v = Version("1.2.9")
    assert(v.patch == 9)
    
    v = Version("2")
    assert(v.patch == 0)
    ```
    
    Returns the third number of the version.
  */
  var patch( default, null ): Int;
  
  /*
    ```lua
    local v = Version("1.2.10-beta4")
    assert(v.prereleaseLabel == "beta")
    
    v = Version("2")
    assert(v.prereleaseLabel == "")
    ```
    
    Returns the pre-release label/keyword. For official releases it's an
    empty string, in other cases it might be `"alpha"`, `"beta"`, `"dev"`, etc.
  */
  var prereleaseLabel( default, null ): String;
  
  /*
    ```lua
    local v = Version("1.2.10-beta4")
    assert(v.prereleaseNumber == 4)
    
    v = Version("2")
    assert(v.prereleaseNumber == 0)
    ```
    
    Returns the pre-release version.
  */
  var prereleaseNumber( default, null ): Int;
  
  /*
    ```lua
    local v = Version("1.2.10")
    ```
    
    You can create a new version from a string. Then access each field
  */
  @:selfCall function new( ?version: EitherType2< Version, String > );

}
