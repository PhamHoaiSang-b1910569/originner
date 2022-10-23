import 'package:flutter/material.dart';
import 'package:originner/common/widgets/error.dart';

import 'package:originner/features/auth/screens/login_screen.dart';
import 'package:originner/features/auth/screens/otp_screen.dart';
import 'package:originner/features/auth/screens/user_information_screen.dart';



Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case OTPScreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
        // ignore: prefer_const_constructors
        builder: (context) => OTPScreen(
          verificationId: verificationId,
        ),
      );
    case UserInformationScreen.routeName:
      return MaterialPageRoute(
        // ignore: prefer_const_constructors
        builder: (context) => UserInformationScreen(
        ),
      );
    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold(
                body: ErrorScreen(error: 'This page dose\'t exist'),
              ));
  }
}
