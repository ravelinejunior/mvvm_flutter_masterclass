import 'contacts_model.dart';
import 'customer_model.dart';

class AuthenticationModel {
  CustomerModel? customerModel;
  ContactsModel? contactsModel;
  AuthenticationModel({
    required this.customerModel,
    required this.contactsModel,
  });
}
