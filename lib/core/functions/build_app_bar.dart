import 'package:flutter/material.dart';
import 'package:blackmarket/core/themes/styles.dart';
import 'package:blackmarket/core/themes/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar(
    {required final String text, required Function()? onPressed}) {
  return AppBar(
    title: Text(
      text,
      style: TextStyles.font18Boldwhite,
    ),
    centerTitle: true,
    actions: [
      Container(
        margin: EdgeInsets.only(right: 30.w, top: 5.h),
        width: 45.w,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20)),
        child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.arrow_forward,
              color: ColorsManger.white,
              size: 26.h,
            )),
      ),
    ],
    leading: const SizedBox(),
  );
}
