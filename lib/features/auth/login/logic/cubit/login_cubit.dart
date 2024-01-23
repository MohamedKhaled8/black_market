import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:blackmarket/features/auth/login/data/model/login_model.dart';
import 'package:blackmarket/features/auth/login/data/repo/login_repo_imp.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepoImp loginRepoImp;
  LoginCubit(
    this.loginRepoImp,
  ) : super( const LoginInitial("name", "password"));

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading(email, password));
    try {
      final data = await loginRepoImp.loginPost(
        body: {
          'email': email,
          'password': password,
        },
        loginUserModel: LoginUserModel.fromJson(const {}),
      );

      data.fold(
        (l) => emit(LoginFailure(l.errMessage)),
        (r) => emit(LoginSuccess(email, password)),
      );
    } catch (e) {
      emit(LoginFailure('Oops, there was an error: $e'));
    }
  }
}
