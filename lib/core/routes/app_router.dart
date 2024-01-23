import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blackmarket/core/routes/routes.dart';
import 'package:blackmarket/core/helper/dio_hleper.dart';
import 'package:blackmarket/features/auth/login/ui/login_screen.dart';
import 'package:blackmarket/features/splash_screen/splash_screen.dart';
import 'package:blackmarket/features/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:blackmarket/features/auth/register/ui/register_screen.dart';
import 'package:blackmarket/core/networking/auth_network/login_ntework.dart';
import 'package:blackmarket/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:blackmarket/features/auth/login/data/repo/login_repo_imp.dart';
import 'package:blackmarket/core/networking/auth_network/register_ntework.dart';
import 'package:blackmarket/features/auth/new_basword/new_password_screen.dart';
import 'package:blackmarket/features/auth/reset_password/ui/reset_password.dart';
import 'package:blackmarket/features/auth/register/logic/cubit/register_cubit.dart';
import 'package:blackmarket/features/auth/register/data/repo/register_repo_imp.dart';
import 'package:blackmarket/features/auth/reset_password/ui/reset_password_code_Screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final argument = settings.arguments;

    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(
                      LoginRepoImp(LoginNetworking(dioHelper: DioHelper())))
                    ..login,
                  child: LoginScreen(),
                ));
      case Routes.registerScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => RegisterCubit(RegisterRepoImp(
                      RegisterNetworking(dioHelper: DioHelper())))
                    ..registerUser,
                  child: RegisterScreen(),
                ));

      case Routes.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());

      case Routes.resetPasswordCode:
        return MaterialPageRoute(
            builder: (_) => const ResetPasswordCodeScreen());

      case Routes.newPasswordScreen:
        return MaterialPageRoute(builder: (_) => const NewPasswordScreen());

      case Routes.bottomNavBarScreen:
        return MaterialPageRoute(builder: (_) => const BottomNavBar());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No route defined for ${settings.name}"),
                  ),
                ));
    }
  }
}
