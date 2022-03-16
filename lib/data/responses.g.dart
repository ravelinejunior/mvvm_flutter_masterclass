// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) {
  return BaseResponse()
    ..status = json['status'] as int?
    ..message = json['message'] as String?;
}

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

CostumerResponse _$CostumerResponseFromJson(Map<String, dynamic> json) {
  return CostumerResponse(
    id: json['id'] as String?,
    name: json['name'] as String?,
    numOfNotifications: json['numOfNotifications'] as int?,
  );
}

Map<String, dynamic> _$CostumerResponseToJson(CostumerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'numOfNotifications': instance.numOfNotifications,
    };

ContactsResponse _$ContactsResponseFromJson(Map<String, dynamic> json) {
  return ContactsResponse(
    phone: json['phone'] as String?,
    link: json['link'] as String?,
    email: json['email'] as String?,
  );
}

Map<String, dynamic> _$ContactsResponseToJson(ContactsResponse instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'link': instance.link,
      'email': instance.email,
    };

AuthenticationResponse _$AuthenticationResponseFromJson(
    Map<String, dynamic> json) {
  return AuthenticationResponse(
    costumerResponse: json['costumer'] == null
        ? null
        : CostumerResponse.fromJson(json['costumer'] as Map<String, dynamic>),
    contactsResponse: json['contacts'] == null
        ? null
        : ContactsResponse.fromJson(json['contacts'] as Map<String, dynamic>),
  )
    ..status = json['status'] as int?
    ..message = json['message'] as String?;
}

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'costumer': instance.costumerResponse,
      'contacts': instance.contactsResponse,
    };
