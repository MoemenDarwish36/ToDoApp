class UserModel {
  static const String collectionName = "user";

  ///this variable was change when i login

  String? id;

  String? email;

  String? userName;

  UserModel({required this.id, required this.email, required this.userName});

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        email = json['email'] as String,
        userName = json['userName'] as String;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'userName': userName,
    };
  }
}
