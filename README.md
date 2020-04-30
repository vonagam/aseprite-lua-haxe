# Aseprite-lua

Haxe externs and helpers for [Aseprite lua scripting api](https://github.com/aseprite/api). Based on version `1.2.18`.

Work in progress. Nothing is missing, but not everything is tested.

In `test` folder you can find some code converted from [aseprite lua tests](https://github.com/aseprite/tests) to haxe.


## Development

### Scripts

#### build/scripts/setup

Copies relevant aseprite repositories into `build/inputs`.

#### build/scripts/build

Builds classes into `build/outputs`.

#### scripts/copy

Copies classes from `build/outputs` into `sources/aseprite`, removing debug comments.

#### scripts/build

`build/scripts/build` + `scripts/copy`.

#### scripts/link

Links root folder for haxelib development.

#### scripts/setup

`build/scripts/setup` + `scripts/build` + `scripts/link`.

#### scripts/test / test/scripts/test

Builds and runs tests in test/sources, one by one. You need to create `test/scripts/env.sh` and export `ASEPRITE_BIN` variable from it. You may run only one test by supplying filter string for module name as first argument (`test Sprite`).

#### scripts/retest

`scripts/build` + `scripts/test`.

#### test/scripts/build

Builds one test module into `test/build.lua`.

#### test/scripts/run

Runs `test/build.lua` with aseprite.

#### scripts/pack

Move relevant files for haxelib into `haxelib` folder and zip it (saved in `haxelib/haxelib.zip`).
