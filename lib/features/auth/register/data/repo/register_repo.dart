import 'package:dartz/dartz.dart';
import 'package:blackmarket/core/error/failures.dart';
import 'package:blackmarket/features/auth/register/data/model/register_model.dart';

abstract class RegisterRepo {
  Future<Either<Failure, RegisterUserModel>> register({
    required RegisterUserModel registerUserModel, required body,
  });
}
