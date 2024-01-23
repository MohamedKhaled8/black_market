// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  final String name;
  final String email;
  final String password;
  final String comfirmPassword;
  final String phone_number;
  const RegisterState(
    this.name,
    this.email,
    this.password,
    this.comfirmPassword,
    this.phone_number,
  );

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {
  const RegisterInitial(super.name, super.email, super.password,
      super.comfirmPassword, super.phone_number);
}

final class RegisterLoading extends RegisterState {
  const RegisterLoading(super.name, super.email, super.password,
      super.comfirmPassword, super.phone_number);
}

final class RegisterSuccess extends RegisterState {
  const RegisterSuccess(super.name, super.email, super.password,
      super.comfirmPassword, super.phone_number);
}

final class RegisterFailure extends RegisterState {
  final String errMessage;

  const RegisterFailure(this.errMessage) : super('', '', '', '', '');
}
