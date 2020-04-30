package aseprite;


/*
  Represents [a tag in the timeline](https://www.aseprite.org/docs/tags/).
*/
extern class Tag {

  /*
    Returns the sprite to which this tag belongs.
  */
  var sprite( default, null ): Sprite;
  
  /*
    Returns the first [`Frame`](https://github.com/aseprite/api/blob/master/api/frame.md#frame) object where this tag starts.
    
    Note: Old versions (Aseprite v1.2.10-beta2) returned a frame number
    instead of a `Frame` object.
  */
  var fromFrame: Frame;
  
  /*
    Returns the last [`Frame`](https://github.com/aseprite/api/blob/master/api/frame.md#frame) object where this tag ends.
    
    Note: Old versions (Aseprite v1.2.10-beta2) returned a frame number
    instead of a `Frame` object.
  */
  var toFrame: Frame;
  
  /*
    Returns the number of frames that this tag contain. Equal to:
    
    ```lua
    local frames = tag.toFrame.frameNumber - tag.fromFrame.frameNumber + 1
    ```
  */
  var frames( default, null ): Int;
  
  /*
    ```lua
    local name = tag.name
    tag.name = name
    ```
    
    Gets or sets the name of the tag (a string).
  */
  var name: String;
  
  /*
    ```lua
    local aniDir = tag.aniDir
    tag.aniDir = AniDir.FORWARD
    tag.aniDir = AniDir.REVERSE
    tag.aniDir = AniDir.PING_PONG
    ```
    
    Gets or sets the *[Animation Direction](https://www.aseprite.org/docs/tags/)* property of the tag.
  */
  var aniDir: AniDir;
  
  /*
    ```lua
    local color = tag.color
    tag.color = color
    ```
    
    Gets or sets the user-defined [color](https://github.com/aseprite/api/blob/master/api/color.md#color) of this tag in the timeline.
  */
  var color: Color;

}
