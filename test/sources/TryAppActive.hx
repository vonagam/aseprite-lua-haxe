import lua.Lua.*;

import aseprite.*;


class TryAppActive {

  public static function main() {

    var app = Aseprite.app;

    var s = new Sprite(32, 64);
    assert(s == app.activeSprite);
    assert(s == app.site.sprite);
    assert(s == app.activeFrame.sprite);
    assert(s == app.site.frame.sprite);
    assert(0 == app.activeFrame.frameNumber);
    assert(0 == app.site.frame.frameNumber);
    assert(0 == app.site.frameNumber);
    assert(0.100 == app.activeFrame.duration);
    assert(0.100 == app.site.frame.duration);
    assert(s == app.activeLayer.sprite);
    assert(s == app.site.layer.sprite);
    assert(s == app.activeCel.sprite);
    assert(s == app.site.cel.sprite);

    app.activeFrame.duration = 0.8;

    app.command.NewFrame.call();
    assert(1 == app.activeFrame.frameNumber);
    assert(0.8 == app.activeFrame.duration);

  }

}
