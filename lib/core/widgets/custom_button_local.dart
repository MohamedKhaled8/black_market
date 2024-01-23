import 'package:flutter/material.dart';
import 'package:blackmarket/core/themes/styles.dart';
import 'package:blackmarket/core/themes/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore_for_file: , sort_constructors_first

class CustomButtonLocal extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const CustomButtonLocal({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60.h,
        width: 327.w,
        decoration: BoxDecoration(
          color: ColorsManger.mainColor,
          borderRadius: BorderRadius.circular(20.w),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyles.font22BoldBlack,
          ),
        ),
      ),
    );
  }
}
