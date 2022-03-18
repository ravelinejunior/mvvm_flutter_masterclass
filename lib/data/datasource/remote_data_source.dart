import 'package:mvvm_flutter_masterclass/data/api/app_api.dart';
import 'package:mvvm_flutter_masterclass/data/request/login_request.dart';
import 'package:mvvm_flutter_masterclass/data/response/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> loginDataSource(LoginRequest loginRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  late AppServiceClient _appServiceClient;
  @override
  Future<AuthenticationResponse> loginDataSource(
      LoginRequest loginRequest) async {
    return await _appServiceClient.loginPostRequest(
      loginRequest.email,
      loginRequest.password,
      loginRequest.imei,
      loginRequest.deviceType,
    );
  }
}
