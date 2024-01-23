import 'package:dio/dio.dart';
import 'package:blackmarket/core/helper/api_helper.dart';
import 'package:blackmarket/core/helper/dio_hleper.dart';
import 'package:blackmarket/features/auth/login/data/model/login_model.dart';

class LoginNetworking {
  final DioHelper dioHelper;
  LoginNetworking({
    required this.dioHelper,
  });

  Future<LoginUserModel> loginPost(
    Map<String, dynamic> json, {
    required body,
  }) async {
    Response response = await dioHelper.post(
      body: body,
      url: ApiHelper.login,
      contentType: Headers.formUrlEncodedContentType,
    );
    var loginUserModel = LoginUserModel.fromJson(response.data);
    return loginUserModel;
  }
}
