import 'package:mvvm_flutter_masterclass/data/api/network_info.dart';
import 'package:mvvm_flutter_masterclass/data/datasource/remote_data_source.dart';
import 'package:mvvm_flutter_masterclass/data/datasource/remote_error_handler.dart';
import 'package:mvvm_flutter_masterclass/data/model/forget_password_model.dart';
import 'package:mvvm_flutter_masterclass/data/response/failure_response.dart';
import 'package:mvvm_flutter_masterclass/data/request/login_request.dart';
import 'package:mvvm_flutter_masterclass/data/model/authentication_model.dart';
import 'package:dartz/dartz.dart';
import 'package:mvvm_flutter_masterclass/domain/repository/repository.dart';
import 'package:mvvm_flutter_masterclass/data/mapper/mapper.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource _dataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, AuthenticationModel>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        // safe call api
        final response = await _dataSource.loginDataSource(loginRequest);

        if (response.status == ApiInternalStatus.SUCCESS) {
          // return data
          //return right from Either class (it means it was Right ok success)

          return Right(response.toDomain());
        } else {
          //return business logic error
          //return left from Either method

          return Left(Failure(
            response.status ?? ApiInternalStatus.FAILURE,
            response.message ?? ResponseMessage.UNKNOWN,
          ));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, ForgetPasswordModel>> forgetPassword(
      String email) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.forgetPasswordDataSource(email);

        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
            response.status ?? ApiInternalStatus.FAILURE,
            response.message ?? ResponseMessage.UNKNOWN,
          ));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
