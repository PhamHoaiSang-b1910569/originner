import 'package:flutter/material.dart';
import 'package:originner/colors.dart';
import 'package:originner/common/widgets/custom_button.dart';
import 'package:originner/features/auth/screens/login_screen.dart';


class LandingScreen extends StatelessWidget {
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
            const SizedBox(height: 50),
            const Text(
              'SanThu',
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.w600,
                color: wColor,
              ),
            ),
            SizedBox(height: size.height / 9),
            Image.asset(
              'assets/mhc.png',
              height: 340,
              width: 340,
              
            ),
            SizedBox(height: size.height / 9),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Đọc chính sách bảo mật của chúng tôi. Nhấn "Đồng ý và tiếp tục" để chấp nhận các điều khoản dịch vụ.',
                style: TextStyle(color: greyColor),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: size.width * 0.75,
              child: CustomButton(
                text: 'Đồng ý và tiếp tục',
                onPressed: ()  => navigateToLoginScreen(context),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
