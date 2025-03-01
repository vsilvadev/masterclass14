/*
DotEnv is a text file format widely used in the backend
to store values ​​by key and value, e.g.:

DATABASE_URL="http://DATABASE"
IS_ADMIN=true
REFRESH_TIME=123454 # second

Create a class that reads a '.env' file and makes it possible to
read data by keys, remembering that primitive types prevail.

RULES:
- Keys and values ​​are separated by the equal sign (=).
- DotEnv files usually have comments that start with HashTag (#). This should be ignored.
*/

import 'dart:io';

void main() {
  //Por que o Directory mostra só a pasta raiz do projeto?
  // print(Directory.current);
  final env = DotEnvReader(pathFile: '.env');

  final dataBaseUrl = env.getEnvValue('DATABASE_URL');
  print(dataBaseUrl == 'http://DATABASE');

  final apiToken = env.getEnvValue('IS_ADMIN');
  print(apiToken == true);

  final expirationToken = env.getEnvValue('REFRESH_TIME');
  print(expirationToken == 123454);
}

class DotEnvReader {
  final String _pathFile;
  Map<String, dynamic> _dotEnvMap = <String, dynamic>{};

  DotEnvReader({required pathFile}) : _pathFile = pathFile {
    _loadFile();
  }

  void _loadFile() {
    final file = File(_pathFile);
    final fileExist = _validateFile(file);
    List<String> fileLines;

    if (fileExist) {
      fileLines = _readFile(file);
    } else {
      throw Exception('File not found');
    }

    _dotEnvMap = _convertFileToMap(fileLines);
  }

  dynamic getEnvValue(String key) {
    return _dotEnvMap[key];
  }

  bool _validateFile(File file) {
    final fileExist = file.existsSync();
    return fileExist ? true : false;
  }

  List<String> _readFile(File file) {
    return file.readAsLinesSync();
  }

  Map<String, dynamic> _convertFileToMap(List<String> lines) {
    final Map<String, dynamic> envContent = {};

    for (int i = 0; i < lines.length; i++) {
      if (lines[i].startsWith('#') || lines[i].isEmpty) {}
      final splittedLine = lines[i].split('=');

      final key = splittedLine[0].trim();
      final valueSplit = splittedLine[1].split('#');
      final value = valueSplit[0].trim();
      envContent[key] = _parseValue(value);
    }

    return envContent;
  }

  dynamic _parseValue(String value) {
    if (value == 'true' || value == 'false') {
      return value == 'true' ? true : false;
    }

    if (int.tryParse(value) != null) {
      return int.parse(value);
    }

    if (double.tryParse(value) != null) {
      return double.parse(value);
    }

    if (value.startsWith("'") && value.endsWith("'") ||
        value.startsWith('"') && value.endsWith('"')) {
      return value.substring(1, value.length - 1);
    }

    return value;
  }
}
