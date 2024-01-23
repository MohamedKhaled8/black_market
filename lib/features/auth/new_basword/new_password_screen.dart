import 'package:flutter/material.dart';
import 'package:blackmarket/core/themes/styles.dart';
import 'package:blackmarket/core/helper/extensions.dart';
import 'package:blackmarket/core/functions/validate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blackmarket/core/functions/build_app_bar.dart';
import 'package:blackmarket/core/widgets/custom_button_local.dart';
import 'package:blackmarket/features/auth/login/ui/widgets/custom_text_form_field.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: buildAppBar(
          onPressed: () {
            context.pop();
          },
          text: 'إنشاء كلمة المرور الجديدة'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "كلمة المرور",
                style: TextStyles.font18WhiteBold,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextFormField(
                controller: null,
                text: "أدخل  كود المرور",
                icon: Icons.email,
                isNumber: false,
                obscureText: false,
                validator: (value) => Validator.validatePassword(value),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "تأكيد كلمة المرور",
                style: TextStyles.font18WhiteBold,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextFormField(
                validator: (value) => Validator.validatePassword(value),
                controller: null,
                text: "أدخل  كود المرور",
                icon: Icons.email,
                isNumber: false,
                obscureText: false,
              ),
              SizedBox(
                height: 350.h,
              ),
              CustomButtonLocal(
                onTap: () {
                  // context.pushNamed(Routes.NewPasswordScreen);
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
