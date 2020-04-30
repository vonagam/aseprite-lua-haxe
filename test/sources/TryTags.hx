import lua.Lua.*;

import aseprite.*;


class TryTags {

  public static function main() {

    var app = Aseprite.app;

    var s = new Sprite(32, 32);
    for (i in 0...7) s.newFrame();
    assert(s.frames.length == 8);

    var a = s.newTag(0, 1);
    var b = s.newTag(2, 3);
    var c = s.newTag(4, 7);

    assert(a.frames == 2);
    assert(b.frames == 2);
    assert(c.frames == 4);

    assert(a == s.tags[0]);
    assert(b == s.tags[1]);
    assert(c == s.tags[2]);

    var i = 0;
    for (k => v in s.tags) {
      assert(i == k);
      assert(v == s.tags[k]);
      i++;
    }

    s.deleteTag(b);
    assert(a == s.tags[0]);
    assert(c == s.tags[1]);

    assert(c.fromFrame.frameNumber == 4);
    assert(c.toFrame.frameNumber == 7);

  }

}
