class UserModel {
  final String name;
  final String email;
  final String password;

  UserModel({required this.name, required this.email, required this.password});

  Map<String, dynamic> toMap() => {
    'name': name,
    'email': email,
    'password': password,
  };

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
    name: map['name'],
    email: map['email'],
    password: map['password'],
  );
}
