class Student {
  String firstName;
  String lastName;
  String identificationNumber;
  String faculty;
  String department;
  String year;
  String imageUrl;
  String sets;

  Student({this.identificationNumber, this.firstName, this.sets});

  factory Student.fromJSON(Map<String, dynamic> json) {
    return Student(
        identificationNumber: json['identificationNumber'],
        firstName: json['firstName'],
        sets: json['sets']);
  }
}
