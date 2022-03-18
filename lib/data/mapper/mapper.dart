import 'package:mvvm_flutter_masterclass/app/extensions.dart';
import 'package:mvvm_flutter_masterclass/data/model/authentication_model.dart';
import 'package:mvvm_flutter_masterclass/data/model/contacts_model.dart';
import 'package:mvvm_flutter_masterclass/data/model/customer_model.dart';
import 'package:mvvm_flutter_masterclass/data/response/responses.dart';

const String emptyString = "";
const int zeroInt = 0;

//convert the responses into a non nullable object (model)

extension CustomerResponseMapper on CostumerResponse? {
  CustomerModel toDomain() {
    return CustomerModel(
      id: this?.id?.orEmpty() ?? emptyString,
      name: this?.name?.orEmpty() ?? emptyString,
      numOfNotifications: this?.numOfNotifications?.orZero() ?? zeroInt,
    );
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  ContactsModel toDomain() {
    return ContactsModel(
      email: this?.email?.orEmpty() ?? emptyString,
      phone: this?.phone?.orEmpty() ?? emptyString,
      link: this?.link?.orEmpty() ?? emptyString,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  AuthenticationModel toDomain() {
    return AuthenticationModel(
        contactsModel: this?.contactsResponse?.toDomain(),
        customerModel: this?.costumerResponse?.toDomain());
  }
}
