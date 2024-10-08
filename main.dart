import 'migrations/library_data.dart';
import 'services/database.dart';

void main() async {
  //---- define a database
  var libraryDb = CsvDb(filePath: 'databases/library_db.csv');

  //---- create a database with defined model
  await libraryDb.create(
    dataModel: [LibraryModel.migrations],
  );

  //---- insert data as model
  // await libraryDb.insert(
  //     data: LibraryModel(
  //         name: 'n4',
  //         fatherName: 'fn4',
  //         address: 'a4',
  //         phoneNumber: 'pn4',
  //         id: 4));

  print('------');

// display all the data
  final allData = await libraryDb.selectAll();
  print('selectAll res: ${allData}');
  print('------');

// display filtered data
  final filteredData = await libraryDb.selectWhere(
      columnName: 'id', targetValue: 2, operation: QueryOps.lte);
  print('selectWhere res: ${filteredData}');
  print('------');
}
