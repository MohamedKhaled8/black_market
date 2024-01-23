import 'package:flutter/material.dart';
import 'package:blackmarket/core/routes/routes.dart';
import 'package:blackmarket/core/themes/styles.dart';
import 'package:blackmarket/core/helper/extensions.dart';
import 'package:blackmarket/core/functions/validate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blackmarket/core/functions/build_app_bar.dart';
import 'package:blackmarket/core/widgets/custom_button_local.dart';
import 'package:blackmarket/features/auth/login/ui/widgets/custom_text_form_field.dart';
import 'package:blackmarket/features/auth/reset_password/ui/widgets/custom_container_detailes.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: buildAppBar(
          onPressed: () {
            context.pop();
          },
          text: "إسترجاع كلمة المرور"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              const CustomContainerDetailes(),
              SizedBox(
                height: 30.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "البريد الإلكتروني",
                    style: TextStyles.font18WhiteBold,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(
                    controller: null,
                    text: "أدخل البريد الإلكتروني",
                    icon: Icons.email,
                    isNumber: false,
                    obscureText: false,
                    validator: (value) => Validator.validateEmail(value),
                  ),
                ],
              ),
              SizedBox(
                height: 350.w,
              ),
              CustomButtonLocal(
                onTap: () {
                  context.pushNamed(Routes.resetPasswordCode);
                },
                text: 'متابعة',
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
