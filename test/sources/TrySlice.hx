import lua.Lua.*;

import aseprite.*;


class TrySlice {

  public static function main() {

    var app = Aseprite.app;

    var s = new Sprite(32, 32);

    var a = s.newSlice([0, 0, 32, 32]);
    assert(a.bounds == new Rectangle([0, 0, 32, 32]));
    assert(a.sprite == s);

    assert(a.name == "Slice");
    a.name = "Slice A";
    assert(a.name == "Slice A");

    assert(a.center == null);
    a.center = new Rectangle([2, 3, 28, 20]);
    assert(a.center == new Rectangle([2, 3, 28, 20]));

    assert(a.pivot == null);
    a.pivot = new Point([16, 17]);
    assert(a.pivot == new Point([16, 17]));

  }

}
