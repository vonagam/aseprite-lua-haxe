package aseprite;


/**
  A set of function to handle file names and the file system.
  
  # Path & File Name Manipulation
**/
extern class AppFS {

  /**
    ```lua
    local fn = "path" .. app.fs.pathSeparator .. "filename.png"
    ```
    
    Returns the preferred path separator of the current platform, it is
    `/` on macOS and Linux, and `\` on Windows. Preferably you should use
    [app.fs.joinPath()](https://github.com/aseprite/api/blob/master/api/app_fs.md#appfsjoinpath).
    
    Example:
    
    ```lua
    local sep = app.fs.pathSeparator
    local fn = "path" .. sep .. "filename.png"
    print(fn)
    ```
    
    Will print `path/filename.png` on macOS or Linux, and `path\filename.png` on Windows.
  **/
  var pathSeparator( default, null ): String;
  
  /**
    Returns the path the Aseprite executable was launched from.
  **/
  var currentPath( default, null ): String;
  
  /**
    Returns the installation path of Aseprite for the current platform.
  **/
  var appPath( default, null ): String;
  
  /**
    Returns the path for temporary files for the current platform.
    
    On macOS or Linux it will be `/tmp`, and Windows it will look like `C:\Users\username\AppData\Local\Temp\`.
  **/
  var tempPath( default, null ): String;
  
  /**
    Returns the current user's Documents path for the current platform.
    
    Depending on the platform, this may return the user's home directory.
  **/
  var userDocsPath( default, null ): String;
  
  /**
    Returns the current user's Aseprite configuration path for the current platform.
    
    You can learn about the specific location of this folder [from the Aseprite documentation](https://www.aseprite.org/docs/preferences-folder/).
    
    # File System Access
  **/
  var userConfigPath( default, null ): String;
  
  /**
    ```lua
    local pathPart = app.fs.filePath(fn)
    ```
    
    Returns the path/directory part (as a string) of the given filename `fn`.
  **/
  @:luaDotMethod function filePath( path: String ): String;
  
  /**
    ```lua
    local fileName = app.fs.fileName(fn)
    ```
    
    Returns the file name (including the extension parth) of the given filename `fn`.
  **/
  @:luaDotMethod function fileName( path: String ): String;
  
  /**
    ```lua
    local extension = app.fs.fileExtension(fn)
    ```
    
    Returns the file extension (without including the `.`) of the given
    filename `fn`. For example:
    
    ```lua
    print(app.fs.fileExtension("path/file.png"))
    ```
    
    Prints `png`.
  **/
  @:luaDotMethod function fileExtension( path: String ): String;
  
  /**
    ```lua
    local title = app.fs.fileTitle(fn)
    ```
    
    Returns the file title (without including the path nor the extension)
    of the given filename `fn`. For example:
    
    ```lua
    print(app.fs.fileExtension("path/file.png"))
    ```
    
    Prints `file`.
  **/
  @:luaDotMethod function fileTitle( path: String ): String;
  
  /**
    ```lua
    local title = app.fs.filePathAndTitle(fn)
    ```
    
    Returns the file path [joined](https://github.com/aseprite/api/blob/master/api/app_fs.md#appfsjoinpath) with the title (without
    including the extension) of the given filename `fn`. For example:
    
    ```lua
    print(app.fs.fileExtension("path/file.png"))
    ```
    
    Prints `path/file`.
  **/
  @:luaDotMethod function filePathAndTitle( path: String ): String;
  
  /**
    Returns the file path converted to a canonical form for the current platform.
    
    Example:
    
    ```lua
    print(app.fs.normalizePath("//home//user//path"))
    ```
    
    Will print as `/home/user/path` on macOS or Linux, and `C:\home\user\path` on Windows.
  **/
  @:luaDotMethod function normalizePath( path: String ): String;
  
  /**
    Can accept any number of string arguments to join together with the path separator for the current platform.
    
    ```lua
    local path = app.fs.joinPath("path1", "path2")
    ```
    
    Returns `path1/path2` on macOS or Linux, and `path1\path2` on Windows.
    
    # Special Folders
  **/
  @:luaDotMethod function joinPath( paths: haxe.extern.Rest< String > ): String;
  
  /**
    ```lua
    local exists = app.fs.isFile(fn)
    ```
    
    Returns true if the given filename `fn` is a file.
  **/
  @:luaDotMethod function isFile( path: String ): Bool;
  
  /**
    ```lua
    local exists = app.fs.isDirectory(fn)
    ```
    
    Returns true if the given filename `fn` is a directory.
  **/
  @:luaDotMethod function isDirectory( path: String ): Bool;
  
  /**
    ```lua
    local size = app.fs.fileSize(fn)
    ```
    
    Returns the file size of the given filename `fn`.
  **/
  @:luaDotMethod function fileSize( path: String ): Int;
  
  /**
    ```lua
    local table = app.fs.listFiles(path)
    ```
    
    Returns a list of files in the given directory `path`. The returned
    value is a table where each element is a file name, each file name is
    relative to the given `path`, they are not full path file names. In
    case that you want to get a list of full file names you can do
    something like this:
    
    ```lua
    local dir = ...
    for _,filename in pairs(app.fs.listFiles(dir)) do
      local fullFilename = app.fs.joinPath(dir, filename)
      ...
    end
    ```
  **/
  @:luaDotMethod function listFiles( path: String ): LuaArray< String >;

}
