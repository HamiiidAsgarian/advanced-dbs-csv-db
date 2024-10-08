import 'migrations/library_data.dart';
import 'services/database.dart';

Future<void> main() async {
  const filePath = 'databases/library_db.csv';
  final libraryDb = CsvDb(filePath: filePath);

//----Create table
  await libraryDb.create(dataModel: [LibraryModel.migrations]);

//----Insert data
  await libraryDb.insert(
    data: LibraryModel(
      name: 'n4',
      fatherName: 'fn4',
      address: 'a4',
      phoneNumber: 'pn4',
      id: 4,
    ),
  );

//----selectAll query
  final allData = await libraryDb.selectAll();
  print('selectAll res: $allData');

//----selectWhere query
  final filteredData = await libraryDb.selectWhere(
    columnName: 'id',
    targetValue: 2,
    operation: QueryOps.lte,
  );
  print('selectWhere res: $filteredData');
}
