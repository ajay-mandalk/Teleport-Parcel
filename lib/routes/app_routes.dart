import 'package:flutter/material.dart';
import 'package:teleportauth/presentation/login_page_screen/login_page_screen.dart';
import 'package:teleportauth/presentation/login_with_otp_two_screen/login_with_otp_two_screen.dart';
import 'package:teleportauth/presentation/login_with_otp_three_screen/login_with_otp_three_screen.dart';
import 'package:teleportauth/presentation/otp_input_empty_screen/otp_input_empty_screen.dart';
import 'package:teleportauth/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:teleportauth/presentation/set_new_password_screen/set_new_password_screen.dart';
import 'package:teleportauth/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String loginPageScreen = '/login_page_screen';

  static const String loginWithOtpTwoScreen = '/login_with_otp_two_screen';

  static const String loginWithOtpThreeScreen = '/login_with_otp_three_screen';

  static const String otpInputEmptyScreen = '/otp_input_empty_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String setNewPasswordScreen = '/set_new_password_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    loginPageScreen: (context) => LoginPageScreen(),
    loginWithOtpTwoScreen: (context) => LoginWithOtpTwoScreen(),
    loginWithOtpThreeScreen: (context) => LoginWithOtpThreeScreen(),
    otpInputEmptyScreen: (context) => OtpInputEmptyScreen(),
    forgotPasswordScreen: (context) => ForgotPasswordScreen(),
    setNewPasswordScreen: (context) => SetNewPasswordScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    initialRoute: (context) => LoginPageScreen(),
  };
}
