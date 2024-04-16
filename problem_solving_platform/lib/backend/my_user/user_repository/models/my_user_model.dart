import 'package:equatable/equatable.dart';

class MyUserModel extends Equatable {
  
  final String id;
  final String username;
  final String email;
  final String password;
  const MyUserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  static const empty = MyUserModel(
    id: "",
    username: "",
    email: "",
    password: "");
  
  bool get isEmpty => this == MyUserModel.empty;

  MyUserModel copyWith({
    String? id,
    String? username,
    String? email,
    String? password,
  }) {
    return MyUserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String,dynamic> toMap(){
    return {
      "user_id": id,
      "username": username,
      "email": email,
      "password": password
    };
  }

  static MyUserModel fromMap(Map userMap){
    return MyUserModel(
      id: userMap["user_id"],
      username: userMap["username"],
      email: userMap["email"],
      password: userMap["password"]
    );
  }

  @override
  List<Object?> get props => [id,username,email,password];
}
