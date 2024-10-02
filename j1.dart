import 'dart:io';
import 'package:csv/csv.dart';
import 'dart:developer' show log;

import 'data/dart_data.dart';

void main() async {
  await MyCSVDataBase().Create(dummyData);
}

class MyCSVDataBase {
  Create(List<List<String>> data) async {
    String csvString = const ListToCsvConverter().convert(data);

    File file = File('data/output.csv');
    await file.writeAsString(csvString);

    log('CSV file created successfully!');
  }
}
