// login_state.dart

part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  const LoginState(
    this.email,
    this.password,
  );

  @override
  List<Object> get props => [
        email,
        password,
      ];
}

class LoginInitial extends LoginState {
  const LoginInitial(
    String email,
    String password,
  ) : super(
          email,
          password,
        );
}

class LoginLoading extends LoginState {
  const LoginLoading(
    String email,
    String password,
  ) : super(
          email,
          password,
        );
}

class LoginSuccess extends LoginState {
  const LoginSuccess(
    String email,
    String password,
  ) : super(
          email,
          password,
        );
}

class LoginFailure extends LoginState {
  final String errMessage;

  const LoginFailure(
    this.errMessage,
  ) : super(
          '',
          '',
        );
}
