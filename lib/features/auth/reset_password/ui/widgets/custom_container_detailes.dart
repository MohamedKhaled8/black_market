import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:blackmarket/core/themes/styles.dart';
import 'package:blackmarket/core/themes/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blackmarket/core/constant/app_image_assets.dart';

class CustomContainerDetailes extends StatelessWidget {
  const CustomContainerDetailes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.h,
      decoration: BoxDecoration(
          color: ColorsManger.gray.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "سنرسل رمز OTP إلى بريدك الإلكتروني للأمان عند\n نسيان كلمة المرور الخاصة بك",
            style: TextStyles.font18Boldwhite.copyWith(fontSize: 14.sp),
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
          ),
          SizedBox(
            width: 10.w,
          ),
          SvgPicture.asset(AppImageAsset.worningIcon),
        ],
      ),
    );
  }
}
