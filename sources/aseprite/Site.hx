package aseprite;


/**
  This is an object that saves the active state of the editor in a
  specific moment. Which active sprite, layer, frame, cel, image,
  etc. where in a specific moment.
  
  If you save the object:
  
  ```lua
  local site = app.site
  ```
  
  The `site` object will not be updated if the active sprite is
  modified.
**/
extern class Site {

  /**
    Gets the [active sprite](https://github.com/aseprite/api/blob/master/api/app.md#appactivesprite) at the time the
    site object was created.
  **/
  var sprite( default, null ): Sprite;
  
  /**
    Gets the [active layer](https://github.com/aseprite/api/blob/master/api/app.md#appactivelayer) at the time the site
    object was created.
  **/
  var layer( default, null ): Layer;
  
  /**
    Gets the [active cel](https://github.com/aseprite/api/blob/master/api/app.md#appactivecel) at the time the site
    object was created.
  **/
  var cel( default, null ): Cel;
  
  /**
    Gets the [active frame](https://github.com/aseprite/api/blob/master/api/app.md#appactiveframe) at the time the site
    object was created.
  **/
  var frame( default, null ): Frame;
  
  /**
    Gets the active frame number (an integer value, 1 is the first frame).
    Same as [`app.site.frame.frameNumber`](https://github.com/aseprite/api/blob/master/api/site.md#siteframe).
  **/
  var frameNumber( default, null ): LuaIndex;
  
  /**
    Gets the [active image](https://github.com/aseprite/api/blob/master/api/app.md#appactiveimage) at the time the site
    object was created.
  **/
  var image( default, null ): Image;

}
