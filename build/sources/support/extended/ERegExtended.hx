package support.extended;


class ERegExtended {

  public static function forEach( ereg: EReg, string: String ) {

    final iterable = { iterator: () -> new ERegEachIterator( ereg, string ) };

    return iterable;

  }

  public static function forMatch( ereg: EReg, string: String, group: Int = 0 ) {

    final iterable = { iterator: () -> new ERegMatchIterator( ereg, string, group ) };

    return iterable;

  }

  public static function forMatches( ereg: EReg, string: String, group: Iterable< Int > ) {

    final iterable = { iterator: () -> new ERegMatchesIterator( ereg, string, group ) };

    return iterable;

  }

  public static function getResult( ereg: EReg, string: String ) {

    final matched = ereg.match( string );

    final result = matched ? ereg : null;

    return result;

  }

  public static function getMatch( ereg: EReg, string: String, group: Int = 0 ) {

    final matched = ereg.match( string );

    final match = matched ? ereg.matched( group ) : null;

    return match;

  }

  public static function getMatches( ereg: EReg, string: String, groups: Iterable< Int > ) {

    final matched = ereg.match( string );

    final matches = matched ? [ for ( group in groups ) ereg.matched( group ) ] : null;

    return matches;

  }

}


private class ERegBaseIterator {

  var ereg: EReg;

  var remainder: String;

  var matched: Bool;

  var updated: Bool = false;


  public function new( ereg: EReg, string: String ) {

    this.ereg = ereg;

    this.remainder = string;

  }


  public function hasNext() {

    update();

    return matched;

  }

  public function beforeNext() {

    update();

    updated = false;

  }


  function update() {

    if ( updated ) return;

    matched = ereg.match( remainder );

    remainder = matched ? ereg.matchedRight() : '';

    updated = true;

  }

}

private class ERegEachIterator extends ERegBaseIterator {

  public function next(): EReg {

    beforeNext();

    return ereg;

  }

}

private class ERegMatchIterator extends ERegBaseIterator {

  var group: Int;


  public function new( ereg: EReg, string: String, group: Int = 0 ) {

    super( ereg, string );

    this.group = group;

  }


  public function next(): String {

    beforeNext();

    return ereg.matched( group );

  }

}

private class ERegMatchesIterator extends ERegBaseIterator {

  var groups: Iterable< Int >;


  public function new( ereg: EReg, string: String, groups: Iterable< Int > ) {

    super( ereg, string );

    this.groups = groups;

  }


  public function next(): Array< String > {

    beforeNext();

    return [ for ( group in groups ) ereg.matched( group ) ];

  }

}
