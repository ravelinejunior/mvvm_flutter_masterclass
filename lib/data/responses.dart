import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class CostumerResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "numOfNotifications")
  int? numOfNotifications;

  CostumerResponse({this.id, this.name, this.numOfNotifications});

  CostumerResponse.fromJsonNative(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name:'];
    numOfNotifications = json['numOfNotifications'];
  }

  factory CostumerResponse.fromJson(Map<String, dynamic> json) =>
      _$CostumerResponseFromJson(json);

  Map<String, dynamic> toJsonNative() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name:'] = name;
    data['numOfNotifications'] = numOfNotifications;
    return data;
  }

  Map<String, dynamic> toJson() => _$CostumerResponseToJson(this);
}

@JsonSerializable()
class ContactsResponse {
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "link")
  String? link;
  @JsonKey(name: "email")
  String? email;

  ContactsResponse({this.phone, this.link, this.email});

  ContactsResponse.fromJsonNative(Map<String, dynamic> json) {
    phone = json['phone'];
    link = json['link'];
    email = json['email'];
  }

  factory ContactsResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponseFromJson(json);

  Map<String, dynamic> toJsonNative() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['link'] = link;
    data['email'] = email;
    return data;
  }

  Map<String, dynamic> toJson() => _$ContactsResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "costumer")
  CostumerResponse? costumerResponse;
  @JsonKey(name: "contacts")
  ContactsResponse? contactsResponse;

  AuthenticationResponse({this.costumerResponse, this.contactsResponse});

  AuthenticationResponse.fromJsonNative(Map<String, dynamic> json) {
    costumerResponse = json['costumer'];
    contactsResponse = json['contacts'];
  }

  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);

  Map<String, dynamic> toJsonNative() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['costumer'] = costumerResponse;
    data['contacts'] = contactsResponse;
    return data;
  }

  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}
