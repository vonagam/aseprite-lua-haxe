import lua.Lua.*;

import aseprite.*;


class TryVersion {

  public static function main() {

    var app = Aseprite.app;

    // assert(string.sub(tostring(app.version), 1, 1) == "1");
    // assert(string.sub(tostring(app.version), 2, 2) == ".");
    assert(app.version.major == 1);

    assert(new Version("1") == new Version("1"));
    assert(new Version("1.1") > new Version("1"));
    assert(new Version("0.1") < new Version("0.2"));
    assert(new Version("1.0.1") > new Version("1"));
    assert(new Version("1.0.1") < new Version("1.1"));
    assert(new Version("1.0.1") == new Version("1.0.1"));
    assert(new Version("1.0.1") != new Version("1.0.2"));
    assert(new Version("1.0.1") > new Version("1.0.1-beta"));
    assert(new Version("1.0.1") > new Version("1.0.1-dev"));
    assert(new Version("1.0.1-beta") > new Version("1.0.1-alpha"));
    assert(new Version("1.0.1-beta50") < new Version("1.0.1-beta100"));
    assert(new Version("1.0.1-beta50") <= new Version("1.0.1-beta100"));
    assert(new Version("1.0.1-beta100") <= new Version("1.0.1-beta100"));

    var v = new Version();
    assert(v.major == 0);
    assert(v.minor == 0);
    assert(v.patch == 0);
    assert(v.prereleaseLabel == "");
    assert(v.prereleaseNumber == 0);

    v = new Version("1.2.10-beta4");
    assert(v.major == 1);
    assert(v.minor == 2);
    assert(v.patch == 10);
    assert(v.prereleaseLabel == "beta");
    assert(v.prereleaseNumber == 4);

  }

}
