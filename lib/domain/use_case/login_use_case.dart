import 'package:dartz/dartz.dart';
import 'package:mvvm_flutter_masterclass/app/functions.dart';
import 'package:mvvm_flutter_masterclass/data/model/authentication_model.dart';
import 'package:mvvm_flutter_masterclass/data/model/login_use_case_input_model.dart';
import 'package:mvvm_flutter_masterclass/data/request/login_request.dart';
import 'package:mvvm_flutter_masterclass/data/response/failure_response.dart';
import 'package:mvvm_flutter_masterclass/domain/repository/repository.dart';
import 'package:mvvm_flutter_masterclass/domain/use_case/base_use_case.dart';

class LoginUseCase
    implements BaseUseCase<LoginUseCaseInputModel, AuthenticationModel> {
  final Repository _repository;
  LoginUseCase(this._repository);
  @override
  Future<Either<Failure, AuthenticationModel>> execute(input) async {
    final deviceInfo = await getDeviceDetails();

    // await _repository.login(
    //   LoginRequest(
    //     email: input.email,
    //     password: input.password,
    //     imei: deviceInfo.identifier,
    //     deviceType: deviceInfo.name,
    //   ),
    // );

    return await _repository.login(
      LoginRequest(
        email: input.email,
        password: input.password,
        imei: "1234",
        deviceType: "Samsung J8",
      ),
    );
  }
}
