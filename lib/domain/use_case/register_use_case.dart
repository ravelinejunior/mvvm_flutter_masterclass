import 'package:dartz/dartz.dart';
import 'package:mvvm_flutter_masterclass/data/model/authentication_model.dart';
import 'package:mvvm_flutter_masterclass/data/model/register_user_model/register_user_model.dart';
import 'package:mvvm_flutter_masterclass/data/request/register_request.dart';
import 'package:mvvm_flutter_masterclass/data/response/failure_response.dart';
import 'package:mvvm_flutter_masterclass/domain/repository/repository.dart';
import 'package:mvvm_flutter_masterclass/domain/use_case/base_use_case.dart';

class RegisterUseCase
    implements BaseUseCase<RegisterUserModel, AuthenticationModel> {
  final Repository _repository;

  RegisterUseCase(this._repository);
  @override
  Future<Either<Failure, AuthenticationModel>> execute(
      RegisterUserModel input) async {
    return await _repository.register(
      RegisterRequest(
        email: input.email,
        userName: input.userName,
        phone: input.phone,
        sex: input.sex,
        password: input.password,
      ),
    );
  }
}
