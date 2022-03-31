import 'package:dartz/dartz.dart';
import 'package:mvvm_flutter_masterclass/data/model/authentication_model.dart';
import 'package:mvvm_flutter_masterclass/data/model/forget_password_model.dart';
import 'package:mvvm_flutter_masterclass/data/request/login_request.dart';
import 'package:mvvm_flutter_masterclass/data/response/failure_response.dart';

abstract class Repository {
  Future<Either<Failure, AuthenticationModel>> login(LoginRequest loginRequest);
  Future<Either<Failure, ForgetPasswordModel>> forgetPassword(String email);
}
