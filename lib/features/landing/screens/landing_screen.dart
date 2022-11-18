import 'package:flutter/material.dart';
import 'package:originner/colors.dart';
import 'package:originner/common/widgets/custom_button.dart';
import 'package:originner/features/auth/screens/login_screen.dart';
import 'package:iconsax/iconsax.dart';

class LandingScreen extends StatelessWidget {
  static const String routeName = '/LandingScreen';
  const LandingScreen({Key? key}) : super(key: key);

  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 70),
            Image.asset(
              'assets/landing.png',
              height: 340,
              width: 340,
            ),
            const SizedBox(height: 60),
            const Text(
              'Welcome to our Originner messaging app',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: blackColor,
              ),
            ),
            // SizedBox(height: size.height / 9),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Wish you have a great experience.',
                style: TextStyle(color: greyColor),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 50),
            FittedBox(
              child: TextButton(
                onPressed: () => navigateToLoginScreen(context),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "Tiếp tục",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: lColor,
                      ),
                    ),
                    const Icon(
                      Iconsax.arrow_right_3,
                      color: lColor,
                    ),
                  ],
                ),
                // const
              ),
            ),
            // SizedBox(
            //   width: size.width * 0.75,
            //   child: CustomButton(
            //     text: 'Đồng ý và tiếp tục',
            //     onPressed: () => navigateToLoginScreen(context),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
