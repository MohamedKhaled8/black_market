import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:blackmarket/core/themes/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPinPhoneField extends StatelessWidget {
  const CustomPinPhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 4,
      obscureText: false,
      autoFocus: true,
      keyboardType: TextInputType.number,
      cursorColor: ColorsManger.mainColor,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(12),
        fieldHeight: 60.h,
        fieldWidth: 60.w,
        activeColor: ColorsManger.mainColor,
        inactiveColor: ColorsManger.mainColor,
        inactiveFillColor: ColorsManger.gray.withOpacity(0.3),
        activeFillColor: const Color(0xFF2A2A2A).withOpacity(1),
        selectedColor: ColorsManger.mainColor,
        selectedFillColor: ColorsManger.gray.withOpacity(0.3),
      ),
      textStyle: const TextStyle(color: Colors.white),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      // errorAnimationController: errorController,
      // controller: textEditingController,
      onCompleted: (code) {
        // otpCode = code;
        // print("Completed");
      },
      onChanged: (value) {
        // print(value);
        // setState(() {
        //   currentText = value;
        // });
      },

      appContext: context,
    );
  }
}
