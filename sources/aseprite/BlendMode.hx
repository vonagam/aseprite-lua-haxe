package aseprite;


@:native( "_G.BlendMode" ) extern enum abstract BlendMode( Int ) {

  var NORMAL;
  
  var MULTIPLY;
  
  var SCREEN;
  
  var OVERLAY;
  
  var DARKEN;
  
  var LIGHTEN;
  
  var COLOR_DODGE;
  
  var COLOR_BURN;
  
  var HARD_LIGHT;
  
  var SOFT_LIGHT;
  
  var DIFFERENCE;
  
  var EXCLUSION;
  
  var HSL_HUE;
  
  var HSL_SATURATION;
  
  var HSL_COLOR;
  
  var HSL_LUMINOSITY;
  
  var ADDITION;
  
  var SUBTRACT;
  
  var DIVIDE;

}
