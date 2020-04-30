import support.io.Files;

import parsers.*;

import serializers.*;


class Main {

  static public function main() {

    final markdowns = new MarkdownsParser();

    final enums = new EnumsParser();

    final classes = new ClassesParser();

    final commands = new CommandsParser();

    new Fixer( markdowns.data, enums.data, classes.data, commands.data );

    new EnumsSerializer( markdowns.data, enums.data );

    new ClassesSerializer( markdowns.data, classes.data );

    Files.transfer( 'copy', 'outputs' );

    Files.transfer( 'copy/enums', 'outputs' );

  }

}
