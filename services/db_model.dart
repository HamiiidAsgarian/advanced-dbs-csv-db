import 'dart:developer';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:path/path.dart';

class MyCsvDb {
  const MyCsvDb({required this.dbName});
  final String dbName;
  String get _filePath => join('databases', '$dbName.csv');

  //Create DB

  create({required List<List<String>> dataModel}) async {
    try {
      final file = File(_filePath);
      if (!await file.exists()) {
        // await MyCsvDb(dbName: 'library_db').create(libraryData);

        String csvString = const ListToCsvConverter().convert(dataModel);

        await file.writeAsString(csvString);

        log('---CSV $dbName file created successfully!---');
      }
    } catch (e) {
      log('---CSV $dbName file creation failed!---');
    }
  }

  insert({required List<List<String>> data}) async {
    try {
      final file = File(_filePath);
      if (!await file.exists()) {
        String csvString = const ListToCsvConverter().convert(data);

        await file.writeAsString(csvString);

        log('---CSV $dbName file inserted successfully!---');
      }
    } catch (e) {
      log('---CSV $dbName file inserted failed!---');
    }
  }

  //Read DB
  Future<List<List<dynamic>>> read() async {
    final file = File(_filePath);
    final csvString = await file.readAsString();
    final data = CsvToListConverter().convert(csvString);
    return data;
  }
}
