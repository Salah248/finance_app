class RegisterModel {
  final int? id;
  final String? userName;
  final String? password;
  final String? email;

  RegisterModel({this.id, this.userName, this.password, this.email});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userName': userName,
      'password': password,
      'email': email,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      id: map['id'] != null ? map['id'] as int : null,
      userName: map['userName'] != null ? map['userName'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }
}
