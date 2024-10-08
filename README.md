# CSV Database Library

A simple CSV database library for Dart, providing basic query operations.

## Features
* Supports CSV file storage and retrieval
* Provides query operations for searching by string and integer values
* Supports various query operators: EQ, NE, GT, GTE, LT, LTE
* Supports creating, dropping, inserting, and selecting data

## Usage
To use this library, create a `CsvDb` object with the path to your CSV file:

```dart
var db = CsvDb(filePath: 'databases/library_db.csv');
```

You can then use the various methods to perform operations on the database:

Create
Create a new CSV database file:

```dart
await db.create(dataModel: [...]); 
```

Drop
Delete the CSV database file:

```dart
await db.drop();
```
Insert
Insert new data into the CSV database:

```dart
await db.insert(data: DbModel(...));
```

Select All
Retrieve all data from the CSV database:

```dart
var data = await db.selectAll();
```
Select Where
Retrieve data from the CSV database based on a query:

```dart
var data = await db.selectWhere(
  columnName: 'fatherName',
  targetValue: 'fn1',
  operation: QueryOps.eq,
);
```
 

Query Operations
The library supports the following query operations:

EQ: Equal to
NE: Not equal to
GT: Greater than
GTE: Greater than or equal to
LT: Less than
LTE: Less than or equal to
Data Model
The library uses a DbModel class to represent the data to be inserted into the database. You can create a new DbModel object and pass it to the insert method:

```dart
var data = DbModel(...);
await db.insert(data: data);
```
 

Testing
The library includes a comprehensive test suite to ensure its functionality.

Contributing
Contributions are welcome! If you'd like to contribute to this library, please fork the repository and submit a pull request.

License
This library is licensed under the MIT License.
