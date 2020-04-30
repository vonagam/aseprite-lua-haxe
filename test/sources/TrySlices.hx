import lua.Lua.*;

import aseprite.*;


class TrySlices {

  public static function main() {

    var app = Aseprite.app;

    var s = new Sprite(32, 32);

    var a = s.newSlice();
    var b = s.newSlice([0, 2, 8, 10]);
    var c = s.newSlice({ x:0, y:0, width:32, height:32 });
    assert(a.bounds == null);
    assert(b.bounds == new Rectangle([0, 2, 8, 10]));
    assert(c.bounds == new Rectangle([0, 0, 32, 32]));

    var i = 0;
    for (k=>v in s.slices) {
      assert(i == k);
      assert(v == s.slices[k]);
      i = i+1;
    }

    s.deleteSlice(b);
    assert(a == s.slices[0]);
    assert(c == s.slices[1]);

  }

}
