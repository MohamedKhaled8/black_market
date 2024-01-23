import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:blackmarket/core/themes/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blackmarket/core/constant/app_image_assets.dart';
import 'package:blackmarket/features/gold_screen/ui/gold_screen.dart';
import 'package:blackmarket/features/profile_screen/ui/profile_screen.dart';
import 'package:blackmarket/features/favorite_screen/ui/favorite_screen.dart';
import 'package:blackmarket/features/currencies_screen/ui/currencies_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with TickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  List<Widget> myPages = [
    const CurrenciesScreen(),
    const GoldScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: myPages,
      ),
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: SizedBox(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BottomAppBar(
              color: ColorsManger.bottomBar,
              child: TabBar(
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                labelColor: ColorsManger.bottomBar,
                controller: tabController,
                indicator: const BoxDecoration(),
                tabs: [
                  Tab(
                    iconMargin: EdgeInsets.only(bottom: 0.h),
                    icon: selectedIndex == 0
                        ? SvgPicture.asset(
                            AppImageAsset.dollarCircle,
                            color: selectedIndex == 0
                                ? ColorsManger.mainColor
                                : ColorsManger.mainColor,
                          )
                        : SvgPicture.asset(
                            AppImageAsset.dollarCircle2,
                            color: selectedIndex == 0
                                ? ColorsManger.gray
                                : ColorsManger.gray,
                          ),
                    child: Text(
                      "العملات",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: selectedIndex == 0
                            ? ColorsManger.mainColor
                            : ColorsManger.white,
                      ), // Adjust the fontSize
                    ),
                  ),
                  Tab(
                    iconMargin: EdgeInsets.only(bottom: 4.h),
                    icon: selectedIndex == 1
                        ? SvgPicture.asset(
                            AppImageAsset.gold2,
                            color: selectedIndex == 0
                                ? ColorsManger.mainColor
                                : ColorsManger.mainColor,
                          )
                        : SvgPicture.asset(
                            AppImageAsset.gold,
                            color: selectedIndex == 0
                                ? ColorsManger.gray
                                : ColorsManger.gray,
                          ),
                    child: Text(
                      "الذهب",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: selectedIndex == 1
                            ? ColorsManger.mainColor
                            : ColorsManger.white,
                      ), // Adjust the fontSize
                    ),
                  ),
                  Tab(
                    iconMargin: EdgeInsets.only(bottom: 4.h),
                    icon: selectedIndex == 2
                        ? SvgPicture.asset(
                            AppImageAsset.favorite2,
                            color: selectedIndex == 0
                                ? ColorsManger.mainColor
                                : ColorsManger.mainColor,
                          )
                        : SvgPicture.asset(
                            AppImageAsset.favorite,
                            color: selectedIndex == 0
                                ? ColorsManger.gray
                                : ColorsManger.gray,
                          ),
                    child: Text(
                      "المفضلة",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: selectedIndex == 2
                            ? ColorsManger.mainColor
                            : ColorsManger.white,
                      ), // Adjust the fontSize
                    ),
                  ),
                  Tab(
                    iconMargin: EdgeInsets.only(bottom: 0.h),
                    icon: selectedIndex == 3
                        ? SvgPicture.asset(
                            AppImageAsset.profile2,
                            color: selectedIndex == 0
                                ? ColorsManger.mainColor
                                : ColorsManger.mainColor,
                          )
                        : SvgPicture.asset(
                            AppImageAsset.profile,
                            color: selectedIndex == 0
                                ? ColorsManger.gray
                                : ColorsManger.gray,
                          ),
                    child: Text(
                      "البروفيل",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: selectedIndex == 3
                            ? ColorsManger.mainColor
                            : ColorsManger.white,
                      ), // Adjust the fontSize
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
