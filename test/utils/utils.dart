import 'dart:convert';
import 'dart:io';

String fixture(String name) {
  final dir = currentDirectory.path;
  return File('$dir/test/fixtures/$name').readAsStringSync();
}

File assetFile(String name) {
  final dir = currentDirectory.path;
  return File('$dir/test/assets/$name');
}

Map<String, dynamic> jsonFixture(String name) =>
    json.decode(fixture(name)) as Map<String, dynamic>;

// https://github.com/flutter/flutter/issues/20907
Directory get currentDirectory {
  var directory = Directory.current;
  if (directory.path.endsWith('/test')) {
    directory = directory.parent;
  }
  return directory;
}
