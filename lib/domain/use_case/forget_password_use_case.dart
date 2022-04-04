import 'package:dartz/dartz.dart';
import 'package:mvvm_flutter_masterclass/data/model/forget_password_model.dart';
import 'package:mvvm_flutter_masterclass/data/response/failure_response.dart';
import 'package:mvvm_flutter_masterclass/domain/repository/repository.dart';
import 'package:mvvm_flutter_masterclass/domain/use_case/base_use_case.dart';

class ForgetPasswordUseCase
    implements BaseUseCase<String, ForgetPasswordModel> {
  final Repository _repository;
  ForgetPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, ForgetPasswordModel>> execute(String input) async {
    return await _repository.forgetPassword(input);
  }
}
