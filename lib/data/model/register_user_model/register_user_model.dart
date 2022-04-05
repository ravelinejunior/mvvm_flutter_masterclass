import 'package:json_annotation/json_annotation.dart';

part 'register_user_model.g.dart';

@JsonSerializable()
class RegisterUserModel {
  @JsonKey(name: 'user_name')
  String userName;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'phone')
  String phone;
  @JsonKey(name: 'sex')
  String sex;
  @JsonKey(name: 'password')
  String password;

  RegisterUserModel({
    required this.userName,
    required this.email,
    required this.phone,
    required this.sex,
    required this.password,
  });

  @override
  String toString() {
    return 'RegisterUserModel(userName: $userName, email: $email, phone: $phone, sex: $sex, password: $password)';
  }

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) {
    return _$RegisterUserModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterUserModelToJson(this);
}
