import lua.Lua.*;

import aseprite.*;


class TryTag {

  public static function main() {

    var app = Aseprite.app;

    var s = new Sprite(32, 32);
    for (i in 0...7) s.newFrame();
    assert(s.frames.length == 8);

    var a = s.newTag(0, 7);
    assert(a.sprite == s);
    assert(a.fromFrame.frameNumber == 0);
    assert(a.toFrame.frameNumber == 7);
    assert(a.frames == 8);

    a.fromFrame = a.sprite.frames[1];
    a.toFrame = a.sprite.frames[4];
    assert(a.fromFrame.frameNumber == 1);
    assert(a.toFrame.frameNumber == 4);

    assert(a.name == "Tag");
    a.name = "Tag A";
    assert(a.name == "Tag A");

    assert(a.aniDir == AniDir.FORWARD);
    a.aniDir = AniDir.REVERSE;
    assert(a.aniDir == AniDir.REVERSE);
    a.aniDir = AniDir.PING_PONG;
    assert(a.aniDir == AniDir.PING_PONG);
    a.aniDir = AniDir.FORWARD;
    assert(a.aniDir == AniDir.FORWARD);

    assert(a.color == new Color(0, 0, 0));
    a.color = new Color(255, 0, 0);
    assert(a.color == new Color(255, 0, 0));

  }

}
