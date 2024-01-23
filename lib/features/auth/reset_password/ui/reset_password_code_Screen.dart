import 'package:flutter/material.dart';
import 'package:blackmarket/core/routes/routes.dart';
import 'package:blackmarket/core/themes/styles.dart';
import 'package:blackmarket/core/themes/app_color.dart';
import 'package:blackmarket/core/helper/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blackmarket/core/functions/build_app_bar.dart';
import 'package:blackmarket/core/widgets/custom_button_local.dart';
import 'package:blackmarket/features/auth/reset_password/ui/widgets/custom_pin_phone_field.dart';
// ignore: file_names

class ResetPasswordCodeScreen extends StatelessWidget {
  const ResetPasswordCodeScreen({super.key});

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
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "قم بإدخال الكود المرسل",
                  style: TextStyles.font18Boldwhite.copyWith(fontSize: 22.h),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "لقد قمنا بإرسال رمز التأكيد الى",
                style: TextStyles.font16Regoler,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                " aliatwan@gmail.com",
                style: TextStyles.font14BoldWhite,
              ),
              SizedBox(
                height: 20.h,
              ),
              const CustomPinPhoneField(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '(42 ثانية)عادة الإرسال',
                    style: TextStyles.font16Regoler
                        .copyWith(color: ColorsManger.mainColor),
                  ),
                  Text(
                    ' .لم تتلق الرمز',
                    style: TextStyles.font16Regoler,
                  ),
                ],
              ),
              SizedBox(
                height: 350.h,
              ),
              CustomButtonLocal(
                onTap: () {
                  context.pushNamed(Routes.newPasswordScreen);
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
