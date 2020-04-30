import lua.Lua.*;

import aseprite.*;


class TryAppTransaction {

  public static function main() {

    var app = Aseprite.app;

    var s = new Sprite(16, 32);
    assert(s.width == 16);
    assert(s.height == 32);

    s.width = 20;
    assert(s.width == 20);
    assert(s.height == 32);

    s.height = 40;
    assert(s.width == 20);
    assert(s.height == 40);

    app.undo();
    assert(s.width == 20);
    assert(s.height == 32);

    app.undo();
    assert(s.width == 16);
    assert(s.height == 32);

    app.transaction(function() {
      s.width = 20;
      s.height = 40;
    });
    assert(s.width == 20);
    assert(s.height == 40);

    app.undo();
    assert(s.width == 16);
    assert(s.height == 32);

    app.redo();
    assert(s.width == 20);
    assert(s.height == 40);

  }

}
