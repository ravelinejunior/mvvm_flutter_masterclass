// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterUserModel _$RegisterUserModelFromJson(Map<String, dynamic> json) {
  return RegisterUserModel(
    userName: json['user_name'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
    sex: json['sex'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$RegisterUserModelToJson(RegisterUserModel instance) =>
    <String, dynamic>{
      'user_name': instance.userName,
      'email': instance.email,
      'phone': instance.phone,
      'sex': instance.sex,
      'password': instance.password,
    };
