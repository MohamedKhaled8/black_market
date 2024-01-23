import 'package:flutter/material.dart';
import 'package:blackmarket/core/themes/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blackmarket/core/constant/app_image_assets.dart';

class CurrenciesScreen extends StatelessWidget {
  const CurrenciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            CustomContainerBarDetailes(),
            CustomPositinContainerStack()
          ],
        ),
      ),
    );
  }
}

class CustomPositinContainerStack extends StatelessWidget {
  const CustomPositinContainerStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 200,
        left: 37,
        child: Container(
          height: 120,
          width: 320,
          decoration: BoxDecoration(
              color: ColorsManger.white,
              borderRadius: BorderRadius.circular(20)),
        ));
  }
}

class CustomContainerBarDetailes extends StatelessWidget {
  const CustomContainerBarDetailes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250.h,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: ColorsManger.bottomBar,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.w, vertical: 20.h),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: ColorsManger.black,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                AppImageAsset.notification,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "مرحباً",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                "علي عبدالله",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            color: ColorsManger.bottomBar,
                            child: const CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  "https://images.unsplash.com/photo-1700681787615-6b7c0bda7d14?q=80&w=1527&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Black Market",
                            style: TextStyle(
                              color: ColorsManger.mainColor,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "بكام في السوق السوداء؟!",
                            style: TextStyle(
                              color: ColorsManger.yelloGradent,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
