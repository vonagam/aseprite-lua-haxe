import lua.Lua.*;

import aseprite.*;


class TrySprite {

  public static function main() {

    var app = Aseprite.app;

    {
      var a = new Sprite(32, 64);
      assert(a.width == 32);
      assert(a.height == 64);
      assert(a.colorMode == ColorMode.RGB); // RGB by default
      assert(a.bounds == new Rectangle({x:0, y:0, width:32, height:64}));

      // Crop and resize
      a.selection.select([2, 3, 4, 5]);
      a.crop();
      assert(a.width == 4);
      assert(a.height == 5);
      assert(a.cels[0].image.width == 32);
      assert(a.cels[0].image.height == 64);
      a.resize([6, 8]);
      assert(a.width == 6);
      assert(a.height == 8);
      assert(a.cels[0].image.width == 32 * 6 / 4); // Check that the image was resized (not only the canvas)
      assert(a.cels[0].image.height == 64 * 8 / 5);
      a.crop({x:-1, y:-1, width:20, height:30});
      assert(a.width == 20);
      assert(a.height == 30);

      // Resize sprite setting width/height (just changing canvas size)
      a.width = 8;
      a.height = 10;
      assert(a.width == 8);
      assert(a.height == 10);

      // Test other Sprite() constructors
      var b = new Sprite(4, 8, ColorMode.INDEXED);
      assert(b.width == 4);
      assert(b.height == 8);
      assert(b.colorMode == ColorMode.INDEXED);

      var c = new Sprite({ colorMode:ColorMode.INDEXED, width:10, height:20 });
      assert(c.width == 10);
      assert(c.height == 20);
      assert(c.colorMode == ColorMode.INDEXED);
    }

    // Transparent color

    {
      var a = new Sprite(32, 32, ColorMode.INDEXED);
      assert(a.transparentColor == 0);
      a.transparentColor = 8;
      assert(a.transparentColor == 8);
    }

    // Palette

    {
      var a = new Sprite(32, 32, ColorMode.INDEXED);
      assert(a.palettes.length == 1);
      assert(a.palettes[0].length == 256);

      var p = new Palette(3);
      p.setColor(0, new Color(255, 0, 0));
      p.setColor(1, new Color(0, 255, 0));
      p.setColor(2, new Color(0, 0, 255));
      a.setPalette(p);

      assert(a.palettes.length == 1);
      assert(a.palettes[0].length == 3);
      assert(a.palettes[0].getColor(0) == new Color(255, 0, 0));
      assert(a.palettes[0].getColor(1) == new Color(0, 255, 0));
      assert(a.palettes[0].getColor(2) == new Color(0, 0, 255));
    }

    // Duplicate & Flatten

    {
      var a = new Sprite(32, 32);
      a.newLayer();
      a.newLayer();
      assert(a.layers.length == 3);

      var b = new Sprite(a);           // Clone a
      a.flatten();                   // Flatten a
      assert(a.layers.length == 1);
      assert(b.layers.length == 3);
    }

    // Resize non-active sprite
    {
      var a = new Sprite(32, 32);
      var b = new Sprite(64, 64);
      app.activeSprite = a;
      a.resize([10, 10]);
      b.resize([20, 20]);
      assert(a.width == 10);
      assert(a.height == 10);
      assert(b.width == 20);
      assert(b.height == 20);
      app.undo();
      assert(a.width == 32);
      assert(a.height == 32);
      app.activeSprite = b;
      app.undo();
      assert(b.width == 64);
      assert(b.height == 64);
    }

  }

}
