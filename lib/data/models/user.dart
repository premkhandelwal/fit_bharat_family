import 'dart:convert';

class User {
  final String firstName;
  final String lastName;
  final String userName;
  final String emailId;
  final String password;
  User({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.emailId,
    required this.password,
  });


  Map<String, dynamic> toMap() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'username': userName,
      'email': emailId,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      userName: map['userName'] ?? '',
      emailId: map['emailId'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(firstName: $firstName, lastName: $lastName, userName: $userName, emailId: $emailId, password: $password)';
  }
}
