import 'package:flutter/material.dart';
import 'package:blackmarket/core/routes/routes.dart';
import 'package:blackmarket/core/themes/app_color.dart';
import 'package:blackmarket/core/routes/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlackMarket extends StatelessWidget {
  final AppRouter appRouter;
  const BlackMarket({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Doc App',
        theme: ThemeData(
            // primaryColor: ColorsManger.mainBlue,
            scaffoldBackgroundColor: ColorsManger.black,
            appBarTheme:
                const AppBarTheme(backgroundColor: ColorsManger.black)),
        initialRoute: Routes.loginScreen,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
