import 'migrations/examinations_data.dart';
import 'migrations/library_data.dart';
import 'migrations/registration_data.dart';
import 'services/db_model.dart';

void main() async {
  var libraryDb = MyCsvDb(dbName: 'library_db');
  var registrationDb = MyCsvDb(dbName: 'registration_db');
  var examinationsDb = MyCsvDb(dbName: 'examination_db');

  //make DBs
  await libraryDb.create(
    dataModel: [LibraryModel.migrations],
  );

  await registrationDb.create(
    dataModel: [RegistrationModel.migrations],
  );

  await examinationsDb.create(
    dataModel: [ExaminationsModel.migrations],
  );

//Read Dbs
  await libraryDb.read();
  // await MyCsvDb(dbName: 'examsinationsDb').read(filePath: 'data/examsinations_db.csv');
  // await MyCsvDb(dbName: 'studentsDb').read(filePath: 'data/students_db.csv');
}
