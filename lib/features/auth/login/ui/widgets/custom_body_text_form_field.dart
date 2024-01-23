import 'package:flutter/material.dart';
import 'package:blackmarket/core/themes/styles.dart';
import 'package:blackmarket/core/functions/validate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blackmarket/features/auth/login/ui/widgets/custom_text_form_field.dart';

class CustomBodyTextFormfieldLogin extends StatelessWidget {
  const CustomBodyTextFormfieldLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
          controller: null,
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
          validator: (value) => Validator.validateEmail(value),
          controller: null,
          text: "أدخل  كود المرور",
          icon: Icons.lock,
          isNumber: false,
          obscureText: false,
        ),
      ],
    );
  }
}
