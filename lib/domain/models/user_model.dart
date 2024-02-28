

class UserModel {
  final String name;
  final String email;

  UserModel(this.name, this.email);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'email': email,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      map['name'] as String,
      map['email'] as String,
    );
  }

}
