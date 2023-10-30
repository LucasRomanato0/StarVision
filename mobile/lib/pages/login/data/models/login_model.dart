import 'package:mobile/pages/login/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  String? login;
  String? email;
  String? phone;
  String? password;

  UserModel({
    this.login,
    this.email,
    this.phone,
    this.password,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['login'] = login;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['password'] = password;
    return _data;
  }
}
