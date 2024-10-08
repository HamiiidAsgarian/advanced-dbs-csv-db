class LibraryModel implements DbModel {
  const LibraryModel(
      {required this.name,
      required this.fatherName,
      required this.address,
      required this.phoneNumber,
      required this.id});
  final String name;
  final String fatherName;
  final String address;
  final String phoneNumber;
  final int id;

  all() => [name, fatherName, address, phoneNumber, id];

  static List<String> get migrations => [
        'name',
        'fatherName',
        'address',
        'phoneNumber',
        'id',
      ];
}

abstract class DbModel {
  List<dynamic> all();
}
