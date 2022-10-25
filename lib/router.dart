import 'package:flutter/material.dart';
import 'package:originner/common/widgets/error.dart';

import 'package:originner/features/auth/screens/login_screen.dart';
import 'package:originner/features/auth/screens/otp_screen.dart';
import 'package:originner/features/auth/screens/user_information_screen.dart';
import 'package:originner/features/select_contacts/screens/select_contacts_screen.dart';
import 'package:originner/screens/mobile_chat_screen.dart';

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
        builder: (context) => const UserInformationScreen(),
      );

    case SelectContactsScreen.routeName:
      return MaterialPageRoute(
        // ignore: prefer_const_constructors
        builder: (context) => const SelectContactsScreen(),
      );

    case MobileChatScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final name = arguments['name'];
      final uid = arguments['uid'];
      // final isGroupChat = arguments['isGroupChat'];
      // final profilePic = arguments['profilePic'];
      return MaterialPageRoute(
        // ignore: prefer_const_constructors
        builder: (context) => MobileChatScreen(
          name: name,
          uid: uid,
          // isGroupChat: isGroupChat,
          // profilePic: profilePic,
        ),
      );

    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold(
                body: ErrorScreen(error: 'This page dose\'t exist'),
              ));
  }
}
