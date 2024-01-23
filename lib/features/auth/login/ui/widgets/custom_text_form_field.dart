import 'package:flutter/material.dart';
import 'package:blackmarket/core/themes/styles.dart';
import 'package:blackmarket/core/themes/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final Function validator;

  final IconData icon;
  final bool obscureText;
  final bool isNumber;
  CustomTextFormField({
    super.key,
    required this.text,
    required this.controller,
    required this.obscureText,
    required this.validator,
    this.onTap,
    required this.icon,
    required this.isNumber,
  });
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validator(value),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      obscureText: obscureText == null || obscureText == false ? false : true,
      keyboardType: isNumber
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.white,
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          hintText: text,
          hintTextDirection: TextDirection.rtl,
          hintStyle: TextStyles.font16Regoler
              .copyWith(color: ColorsManger.white.withOpacity(0.6)),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.2),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide.none),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide.none),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: Colors.red))),
      cursorColor: const Color.fromRGBO(255, 255, 255, 1),
      style: const TextStyle(color: ColorsManger.white),
    );
  }
}
