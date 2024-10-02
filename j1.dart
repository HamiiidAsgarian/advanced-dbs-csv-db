import 'migrations/library_data.dart';
import 'migrations/registration_data.dart';
import 'services/db_model.dart';

void main() async {
  var a1 = MyCsvDb(dbName: 'libraryDb');
  var a2 = MyCsvDb(dbName: 'registrationDb');

  //make DBs
  await a1.create(
    modelData: libraryData,
  );

  await a2.create(
    modelData: registrationData,
  );

  // await MyCsvDb(dbName: 'examinationsDb').create(
  //   modelData: libraryData,
  //   filePath: 'data/examinations_db.csv',
  // );

//Read Dbs
  await a1.read();
  // await MyCsvDb(dbName: 'examsinationsDb').read(filePath: 'data/examsinations_db.csv');
  // await MyCsvDb(dbName: 'studentsDb').read(filePath: 'data/students_db.csv');
}
