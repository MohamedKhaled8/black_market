import 'package:dartz/dartz.dart';
import 'package:blackmarket/core/error/failures.dart';
import 'package:blackmarket/features/auth/login/data/repo/login_repo.dart';
import 'package:blackmarket/features/auth/login/data/model/login_model.dart';
import 'package:blackmarket/core/networking/auth_network/login_ntework.dart';

class LoginRepoImp extends LoginRepo {
  final LoginNetworking loginNetworking;

  LoginRepoImp(this.loginNetworking);

  @override
  Future<Either<Failure, LoginUserModel>> loginPost({
    required LoginUserModel loginUserModel,
    required body,
  }) async {
    try {
      await loginNetworking.loginPost(
        loginUserModel.toJson(),
        body: body,
      );
      return right(loginUserModel);
    } catch (e) {
      return Left(
          ServerFailure(errMessage: e.toString() ?? 'Oops there was an error'));
    }
  }
}
