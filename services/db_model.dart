import 'dart:developer';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:path/path.dart';

class MyCsvDb {
  const MyCsvDb({required this.dbName});
  final String dbName;
  String get _filePath => join('databases', '$dbName.csv');

  //Create DB

  create({required List<List<String>> modelData}) async {
    try {
      final file = File(_filePath);
      if (!await file.exists()) {
        // await MyCsvDb(dbName: 'library_db').create(libraryData);

        String csvString = const ListToCsvConverter().convert(modelData);

        await file.writeAsString(csvString);

        log('---CSV file created successfully!---');
      }
    } catch (e) {
      log('---CSV file creation failed!---');
    }
  }

  //Read DB
  read() async {
    final file = File(_filePath);
    final csvString = await file.readAsString();
    final data = CsvToListConverter().convert(csvString);

    print(data);
  }
}
