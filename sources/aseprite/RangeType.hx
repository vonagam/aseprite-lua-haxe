package aseprite;


/*
  Type of [range](https://github.com/aseprite/api/blob/master/api/range.md#rangetype) selected in the timeline.
*/
@:native( "_G.RangeType" ) extern enum abstract RangeType( Int ) {

  /*
    When there is no selection.
    
    ![Empty](https://github.com/aseprite/api/blob/master/api/rangetype/empty.png)
  */
  var EMPTY;
  
  /*
    When the selection is in the layers.
    
    ![Layers](https://github.com/aseprite/api/blob/master/api/rangetype/layers.png)
  */
  var LAYERS;
  
  /*
    When the selection is in the frames.
    
    ![Frames](https://github.com/aseprite/api/blob/master/api/rangetype/frames.png)
  */
  var FRAMES;
  
  /*
    When the selection is in the cels.
    
    ![Cels](https://github.com/aseprite/api/blob/master/api/rangetype/cels.png)
  */
  var CELS;

}
