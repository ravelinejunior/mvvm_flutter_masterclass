import 'package:dio/dio.dart';
import 'package:mvvm_flutter_masterclass/app/constants.dart';
import 'package:mvvm_flutter_masterclass/data/response/responses.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: constBaseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/costumer/login")
  Future<AuthenticationResponse> loginPostRequest(
    @Field("email") String email,
    @Field("password") String password,
    @Field("imei") String imei,
    @Field("device_type") String deviceType,
  );

  @POST("/costumer/forgetPassword")
  Future<ForgetPasswordResponse> forgetPostRequest(
    @Field("email") String email,
  );

  @POST("/costumer/register")
  Future<AuthenticationResponse> registerPostRequest(
    @Field("user_name") String userName,
    @Field("email") String email,
    @Field("phone") String phone,
    @Field("sex") String sex,
    @Field("password") String password,
  );
}
