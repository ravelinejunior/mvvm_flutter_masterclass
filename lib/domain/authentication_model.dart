import 'package:mvvm_flutter_masterclass/domain/contacts_model.dart';
import 'package:mvvm_flutter_masterclass/domain/customer_model.dart';

class AuthenticationModel {
  CustomerModel? customerModel;
  ContactsModel? contactsModel;
  AuthenticationModel({
    required this.customerModel,
    required this.contactsModel,
  });
}
