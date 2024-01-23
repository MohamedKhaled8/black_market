import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blackmarket/core/routes/routes.dart';
import 'package:blackmarket/core/themes/styles.dart';
import 'package:blackmarket/core/error/failures.dart';
import 'package:blackmarket/core/helper/extensions.dart';
import 'package:blackmarket/core/functions/validate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blackmarket/core/functions/build_app_bar.dart';
import 'package:blackmarket/core/widgets/custom_button_local.dart';
import 'package:blackmarket/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:blackmarket/features/auth/login/ui/widgets/custom_text_form_field.dart';
import 'package:blackmarket/features/auth/login/ui/widgets/custom_text_new_account.dart';
import 'package:blackmarket/features/auth/login/ui/widgets/custom_row_remember_me_and_reset_password.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);

    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(onPressed: () {}, text: ''),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "تسجيل الدخول \nالى حسابك",
                    style: TextStyles.font26WhiteBold,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Form(
                    key: _globalKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "البريد الإلكتروني",
                          style: TextStyles.font18WhiteBold,
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        CustomTextFormField(
                          controller: emailCont,
                          text: 'أدخل البريد الإلكتروني',
                          icon: Icons.email_outlined,
                          isNumber: false,
                          obscureText: false,
                          validator: (value) => Validator.validateEmail(value),
                        ),
                        SizedBox(
                          height: 20.w,
                        ),
                        Text(
                          "كلمة المرور",
                          style: TextStyles.font18WhiteBold,
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        CustomTextFormField(
                          controller: passCont,
                          text: "أدخل  كود المرور",
                          icon: Icons.lock,
                          isNumber: false,
                          obscureText: false,
                          validator: (value) =>
                              Validator.validatePassword(value),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 20.h,
                ),
                const CustomRowRememerMeAndResetPassword(),
                SizedBox(
                  height: 20.h,
                ),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is LoginFailure) {
                      ScaffoldMessenger(
                        child: Text(ServerFailure(errMessage: state.errMessage)
                            .toString()),
                      );
                    } else {
                      return CustomButtonLocal(
                        onTap: () async {
                          if (_globalKey.currentState!.validate()) {
                            await loginCubit.login(
                                email: emailCont.text, password: passCont.text);
                          }
                          // ignore: use_build_context_synchronously
                          context.pushNamed(Routes.newPasswordScreen);
                        },
                        text: 'التالي',
                      );
                    }
                    return CustomButtonLocal(
                      onTap: () async {
                        if (_globalKey.currentState!.validate()) {
                          await loginCubit.login(
                              email: emailCont.text, password: passCont.text);
                        }
                        // ignore: use_build_context_synchronously
                        context.pushNamed(Routes.newPasswordScreen);
                      },
                      text: 'التالي',
                    );
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextNewAccount(
                  onPressed: () {
                    context.pushNamed(Routes.registerScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
