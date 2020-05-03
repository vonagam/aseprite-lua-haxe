package aseprite;


@:native( "_G.FilterChannels" ) extern enum abstract FilterChannels( Int ) {

  var RED;
  
  var GREEN;
  
  var BLUE;
  
  var ALPHA;
  
  var GRAY;
  
  var INDEX;
  
  /**
    Same as `FilterChannels.RED | FilterChannels.GREEN | FilterChannels.BLUE`.
  **/
  var RGB;
  
  /**
    Same as `FilterChannels.RED | FilterChannels.GREEN | FilterChannels.BLUE | FilterChannels.ALPHA`.
  **/
  var RGBA;
  
  /**
    Same as `FilterChannels.GRAY | FilterChannels.ALPHA`.
  **/
  var GRAYA;

}
