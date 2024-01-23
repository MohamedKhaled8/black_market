import 'package:dartz/dartz.dart';
import 'package:blackmarket/core/error/failures.dart';
import 'package:blackmarket/core/networking/auth_network/register_ntework.dart';
import 'package:blackmarket/features/auth/register/data/repo/register_repo.dart';
import 'package:blackmarket/features/auth/register/data/model/register_model.dart';

class RegisterRepoImp extends RegisterRepo {
  final RegisterNetworking registerNetworking;

  RegisterRepoImp(this.registerNetworking);

  @override
  Future<Either<Failure, RegisterUserModel>> register({
    required RegisterUserModel registerUserModel,
    required body,
  }) async {
    try {
      await registerNetworking.registerPost(
        registerUserModel.toJson(),
        body: body,
      );
      return right(registerUserModel);
    } catch (e) {
      return Left(
          ServerFailure(errMessage: e.toString() ?? 'Oops there was an error'));
    }
  }
}
