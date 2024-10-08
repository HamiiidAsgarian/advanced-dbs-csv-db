import 'package:test/test.dart';

import '../services/database.dart';

void main() {
  var reallibraryDb = CsvDb(filePath: 'databases/library_db.csv');

  group('search by string', () {
    test('selectWhere EQ string works currectly', () async {
      var selectRes = await reallibraryDb.selectWhere(
        columnName: 'fatherName',
        targetValue: 'fn1',
        operation: QueryOps.eq,
      );
      expect(selectRes.length, 2,
          reason: 'becuse by default there is 2 of this data');

      expect(selectRes[0][1], 'fn1', reason: 'the first data should be fn1');
      expect(selectRes[1][1], 'fn1',
          reason: 'Also the second data should be fn1');
      ;
    });

//----

    test('selectWhere NE string works currectly', () async {
      var selectRes = await reallibraryDb.selectWhere(
        columnName: 'fatherName',
        targetValue: 'fn1',
        operation: QueryOps.neq,
      );
      expect(selectRes.length, 2,
          reason:
              'becuse by default there is 2 other data that are not matched');

      expect(selectRes[0][1], isNot('fn1'),
          reason: 'the first data should not be fn1');
      expect(selectRes[1][1], isNot('fn1'),
          reason: 'Also the second data should not fn1');
      ;
    });
  });

  //----

  group('search by int', () {
    test('selectWhere EQ int works currectly', () async {
      var selectRes = await reallibraryDb.selectWhere(
        columnName: 'id',
        targetValue: 1,
        operation: QueryOps.eq,
      );
      expect(selectRes.length, 2,
          reason: 'becuse by default there is 2 of this data');

      expect(selectRes[0][4], 1, reason: 'the first data should be 1');
      expect(selectRes[1][4], 1, reason: 'Also the second data should be 1');
      ;
    });

    test('selectWhere NE int works currectly', () async {
      var selectRes = await reallibraryDb.selectWhere(
        columnName: 'id',
        targetValue: 1,
        operation: QueryOps.neq,
      );
      expect(selectRes.length, 2,
          reason:
              'becuse by default there is 2 other data that are not matched');

      expect(selectRes[0][4], isNot(1),
          reason: 'the first data should not be 1');
      expect(selectRes[1][4], isNot(1),
          reason: 'Also the second data should not 1');
      ;
    });

    test('selectWhere GT int works currectly', () async {
      var selectRes = await reallibraryDb.selectWhere(
        columnName: 'id',
        targetValue: 1,
        operation: QueryOps.gt,
      );
      expect(selectRes.length, 2,
          reason: 'becuse by default there is 2 of this data');

      expect(selectRes[0][4], 2, reason: 'the first data should be 2');
      expect(selectRes[1][4], 3, reason: 'Also the second data should be 3');
      ;
    });

    test('selectWhere GTE int works currectly', () async {
      var selectRes = await reallibraryDb.selectWhere(
        columnName: 'id',
        targetValue: 1,
        operation: QueryOps.gte,
      );
      expect(selectRes.length, 4,
          reason: 'becuse by default there is 2 of this data');

      expect(selectRes[0][4], 1, reason: 'the first data should be 1');
      expect(selectRes[1][4], 1, reason: 'Also the second data should be 1');
      expect(selectRes[2][4], 2, reason: 'Also the third data should be 2');
      expect(selectRes[3][4], 3, reason: 'Also the third data should be 3');

      ;
    });

    test('selectWhere LT int works currectly', () async {
      var selectRes = await reallibraryDb.selectWhere(
        columnName: 'id',
        targetValue: 2,
        operation: QueryOps.lt,
      );
      expect(selectRes.length, 2,
          reason: 'becuse by default there is 2 of this data');

      expect(selectRes[0][4], 1, reason: 'the first data should be 1');
      expect(selectRes[1][4], 1, reason: 'Also the second data should be 1');
      ;
    });

    test('selectWhere LTE int works currectly', () async {
      var selectRes = await reallibraryDb.selectWhere(
        columnName: 'id',
        targetValue: 2,
        operation: QueryOps.lte,
      );
      expect(selectRes.length, 3,
          reason: 'becuse by default there is 2 of this data');

      expect(selectRes[0][4], 1, reason: 'the first data should be 1');
      expect(selectRes[1][4], 1, reason: 'Also the second data should be 1');
      expect(selectRes[2][4], 2, reason: 'Also the third data should be 2');
      ;
    });
  });

  //----
}
