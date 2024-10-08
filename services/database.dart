import 'dart:developer';
import 'dart:io';

import 'package:csv/csv.dart';

import '../migrations/library_data.dart';

class CsvDb {
  final File _file;

  CsvDb({required String filePath}) : _file = File(filePath);
  //Create DB
  create({required List<List<dynamic>> dataModel}) async {
    try {
      if (!await _file.exists()) {
        String csvString = const ListToCsvConverter().convert(dataModel);

        await _file.writeAsString(csvString);

        log('---CSV ${_file.path} file created successfully!---');
      }
    } catch (e) {
      log('---CSV ${_file.path} file creation failed!---');
    }
  }

  Future<void> drop() async {
    try {
      if (await _file.exists()) {
        await _file.delete();
        log('---CSV ${_file.path} file deleted successfully!---');
      }
    } catch (e) {
      log('---CSV ${_file.path} file deletion failed!---');
    }
  }

  Future<void> insert({required DbModel data}) async {
    try {
      if (await _file.exists()) {
        final existingData = await selectAll();
        await _file.writeAsString(
          const ListToCsvConverter().convert([...existingData, data.all()]),
        );

        log('---CSV ${_file.path} file inserted successfully!---');
      } else {
        await create(dataModel: [data.all()]);
      }
    } catch (e) {
      log('---CSV ${_file.path} file inserted failed!---');
    }
  }

  //Read DB
  Future<List<List<dynamic>>> selectAll() async {
    // final file = File(_file);
    final csvString = await _file.readAsString();
    final data = CsvToListConverter().convert(csvString);
    return data;
  }

  Future<List<List<dynamic>>> selectWhere({
    required String columnName,
    required dynamic targetValue,
    QueryOps operation = QueryOps.eq,
  }) async {
    // final file = File(_file);
    final csvString = await _file.readAsString();
    final table = CsvToListConverter().convert(csvString);

    var tableTitle = table.first;
    var targetIDColumnIndex =
        tableTitle.indexOf(tableTitle.where((e) => e == columnName).first);

    var tableWithoutTitle = table.skip(1).toList();
    var b = tableWithoutTitle.where((e) {
      dynamic valueOnIndex = e[targetIDColumnIndex];

      // bool isNumber = valueOnIndex is num;
      if (valueOnIndex is String) {
        switch (operation) {
          case QueryOps.eq:
            return valueOnIndex == targetValue.toString();
          case QueryOps.neq:
            return valueOnIndex != targetValue.toString();

          case QueryOps.gt:
          case QueryOps.gte:
          case QueryOps.lt:
          case QueryOps.lte:
            throw Exception(
                'Unsupported operation $operation for string value');
        }
      } else {
        switch (operation) {
          case QueryOps.eq:
            return valueOnIndex == targetValue;
          case QueryOps.neq:
            return valueOnIndex != targetValue;

          case QueryOps.gt:
            return valueOnIndex > targetValue;

          case QueryOps.gte:
            return valueOnIndex >= targetValue;

          case QueryOps.lt:
            return valueOnIndex < targetValue;

          case QueryOps.lte:
            return valueOnIndex <= targetValue;
        }
      }
    }).toList();

    return b;
  }
}

enum QueryOps { eq, neq, gt, gte, lt, lte }
