import lua.Lua.*;

import aseprite.*;


class TryAppFS {

  public static function main() {

    var app = Aseprite.app;

    var fs = app.fs;
    var sep = fs.pathSeparator;

    assert('' == fs.filePath('first.png'));
    assert('path' == fs.filePath('path/second.png'));
    assert('C:\\path' == fs.filePath('C:\\path\\third.png'));

    assert('first.png' == fs.fileName('first.png'));
    assert('second.png' == fs.fileName('path/second.png'));
    assert('third.png' == fs.fileName('C:\\path\\third.png'));

    assert('png' == fs.fileExtension('path/file.png'));

    assert('first' == fs.fileTitle('first.png'));
    assert('second' == fs.fileTitle('path/second.png'));
    assert('third' == fs.fileTitle('C:\\path\\third.png'));

    assert('first' == fs.filePathAndTitle('first.png'));
    assert('path/second' == fs.filePathAndTitle('path/second.png'));
    assert('C:\\path\\third' == fs.filePathAndTitle('C:\\path\\third.png'));

    assert('hi/bye' == fs.joinPath('hi/', 'bye'));
    assert('hi/bye${ sep }smth.png' == fs.joinPath('hi/', 'bye', 'smth.png'));

    var pwd = fs.currentPath;
    assert(pwd != null);
    assert(fs.isDirectory(pwd));
    assert(! fs.isFile(pwd));

  }

}
