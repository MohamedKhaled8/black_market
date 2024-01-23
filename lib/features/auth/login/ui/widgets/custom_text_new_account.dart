import 'package:flutter/material.dart';
import 'package:blackmarket/core/themes/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class CustomTextNewAccount extends StatelessWidget {
  final Function()? onPressed;
  const CustomTextNewAccount({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: onPressed,
            child: Text(
              ' إنشاء حساب',
              style:
                  TextStyle(color: ColorsManger.yelloGradent, fontSize: 18.sp),
            )),
        Text(
          'لا تمتلك حساب؟',
          style: TextStyle(color: Colors.grey, fontSize: 16.sp),
        ),
      ],
    );
  }
}
