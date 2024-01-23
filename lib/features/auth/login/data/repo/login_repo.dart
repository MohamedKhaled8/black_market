import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import 'package:blackmarket/features/auth/login/data/model/login_model.dart';


abstract class LoginRepo {
  Future<Either<Failure, LoginUserModel>> loginPost({
    required LoginUserModel loginUserModel,
    required body,
  });
}