class ExaminationsModel {
  const ExaminationsModel(
      {required this.name,
      required this.fatherName,
      required this.address,
      required this.phoneNumber});
  final String name;
  final String fatherName;
  final String address;
  final String phoneNumber;

  static List<String> get migrations => [
        'name',
        'fatherName',
        'address',
        'phoneNumber',
      ];
}
