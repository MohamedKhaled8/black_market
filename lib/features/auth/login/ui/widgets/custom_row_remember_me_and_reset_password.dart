import 'package:flutter/material.dart';
import 'package:blackmarket/core/themes/styles.dart';
import 'package:blackmarket/core/themes/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRowRememerMeAndResetPassword extends StatelessWidget {
  const CustomRowRememerMeAndResetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                "هل نسيت كلمة المرور ؟",
                style: TextStyles.font18WhiteBold
                    .copyWith(color: ColorsManger.yelloGradent),
              ),
            )
          ],
        ),
        Row(
          children: [
            Text(
              "تذكرني",
              style: TextStyles.font18WhiteBold,
            ),
            SizedBox(
              width: 10.w,
            ),
            Container(
              height: 20.h,
              width: 20.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: ColorsManger.white)),
            ),
          ],
        )
      ],
    );
  }
}
