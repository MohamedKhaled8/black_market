import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blackmarket/core/themes/styles.dart';
import 'package:blackmarket/core/routes/routes.dart';
import 'package:blackmarket/core/error/failures.dart';
import 'package:blackmarket/core/helper/extensions.dart';
import 'package:blackmarket/core/functions/validate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blackmarket/core/functions/build_app_bar.dart';
import 'package:blackmarket/core/widgets/custom_button_local.dart';
import 'package:blackmarket/features/auth/register/logic/cubit/register_cubit.dart';
import 'package:blackmarket/features/auth/login/ui/widgets/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final GlobalKey<FormState> _globalKeyRegister = GlobalKey<FormState>();

  final TextEditingController nameCont = TextEditingController();

  final TextEditingController emailCont = TextEditingController();

  final TextEditingController passCont = TextEditingController();

  final TextEditingController confirmPassCont = TextEditingController();

  final TextEditingController phoneCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final registerCubit = BlocProvider.of<RegisterCubit>(context);

    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(
            onPressed: () {
              context.pop();
            },
            text: 'إنشاء حساب جديد'),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                    return Form(
                        key: _globalKeyRegister,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "الاسم بالكامل",
                              style: TextStyles.font18WhiteBold,
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            CustomTextFormField(
                              controller: nameCont,
                              text: 'أدخل الاسم بالكامل',
                              icon: Icons.email_outlined,
                              isNumber: false,
                              obscureText: false,
                              validator: (value) =>
                                  Validator.validateUsername(value),
                            ),
                            SizedBox(
                              height: 20.w,
                            ),
                            Text(
                              "البريد الإلكتروني",
                              style: TextStyles.font18WhiteBold,
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            CustomTextFormField(
                              controller: emailCont,
                              text: "أدخل البريد الإلكتروني",
                              icon: Icons.lock,
                              isNumber: false,
                              obscureText: false,
                              validator: (value) =>
                                  Validator.validateEmail(value),
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
                            SizedBox(
                              height: 20.w,
                            ),
                            Text(
                              "تأكيد كلمة المرور",
                              style: TextStyles.font18WhiteBold,
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            CustomTextFormField(
                              validator: (value) =>
                                  Validator.validatePassword(value),
                              controller: confirmPassCont,
                              text: "أدخل  كود المرور",
                              icon: Icons.lock,
                              isNumber: false,
                              obscureText: false,
                            ),
                            SizedBox(
                              height: 20.w,
                            ),
                            Text(
                              "Phone",
                              style: TextStyles.font18WhiteBold,
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            CustomTextFormField(
                              controller: phoneCont,
                              text: "Phone",
                              icon: Icons.lock,
                              isNumber: true,
                              obscureText: false,
                              validator: (value) =>
                                  Validator.validatePhoneNumber(value),
                            ),
                          ],
                        ));
                  },
                ),
                SizedBox(
                  height: 100.h,
                ),
                BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                    if (state is RegisterLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is RegisterFailure) {
                      ScaffoldMessenger(
                          child: Text(
                              ServerFailure(errMessage: state.errMessage)
                                  .toString()));
                    } else {
                      return CustomButtonLocal(
                        onTap: () async {
                          if (_globalKeyRegister.currentState!.validate()) {
                            await registerCubit.registerUser(
                                name: nameCont.text,
                                email: emailCont.text,
                                password: passCont.text,
                                password_confirmation: confirmPassCont.text,
                                phone_number: passCont.text);

                            // ignore: use_build_context_synchronously
                            context.pushNamed(Routes.loginScreen);
                          }
                        },
                        text: 'التالي',
                      );
                    }
                    return const SizedBox();
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
