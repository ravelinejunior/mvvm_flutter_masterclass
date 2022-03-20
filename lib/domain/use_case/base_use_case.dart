import 'package:dartz/dartz.dart';
import 'package:mvvm_flutter_masterclass/data/response/failure_response.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
