import 'package:dio/dio.dart';
import 'package:blackmarket/core/helper/api_helper.dart';
import 'package:blackmarket/core/helper/dio_hleper.dart';
import 'package:blackmarket/features/auth/register/data/model/register_model.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class RegisterNetworking {
  final DioHelper dioHelper;
  RegisterNetworking({
    required this.dioHelper,
  });

  Future<RegisterUserModel> registerPost(
    Map<String, dynamic> json, {
    required body,
  }) async {
    Response response = await dioHelper.post(
      body: body,
      url: ApiHelper.register,
      contentType: Headers.formUrlEncodedContentType,
    );
    var registerUserModel = RegisterUserModel.fromJson(response.data);
    return registerUserModel;
  }
}
