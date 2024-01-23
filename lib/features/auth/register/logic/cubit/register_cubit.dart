import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:blackmarket/features/auth/register/data/model/register_model.dart';
import 'package:blackmarket/features/auth/register/data/repo/register_repo_imp.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepoImp registerRepoImp;
  RegisterCubit(this.registerRepoImp)
      : super(const RegisterInitial('name', 'email', 'password',
            'password_confirmation', 'phone_number'));
  final secureStorage = const FlutterSecureStorage();

  Future<void> registerUser({
    required String name,
    required String email,
    required String password,
    required String password_confirmation,
    required String phone_number,
  }) async {
    emit(RegisterLoading(
        name, email, password, password_confirmation, phone_number));

    try {
      final data = await registerRepoImp.register(
        body: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': password_confirmation,
          'phone_number': phone_number,
        },
        registerUserModel: RegisterUserModel.fromJson(const {}),
      );

      data.fold(
        (l) => emit(RegisterFailure(l.errMessage)),
        (r) async {
          final userDataString = await secureStorage.read(key: 'userData');
          final userData = jsonDecode(userDataString ?? '{}');

          // Adapt the following lines based on the actual structure of your JSON data
          final user = userData['user'] ?? {};
          // ignore: unused_local_variable
          final expiresAt = userData['expires_at'] ?? '';

          await secureStorage.write(
              key: 'userData', value: jsonEncode(registerUser));
          emit(RegisterSuccess(user.toString(), email, password,
              password_confirmation, phone_number));
        },
      );
    } catch (e) {
      emit(RegisterFailure('Oops, there was an error: $e'));
    }
  }
}
