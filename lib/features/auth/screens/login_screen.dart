import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:originner/colors.dart';
import 'package:originner/common/utils/utils.dart';

import 'package:originner/common/widgets/custom_button.dart';
import 'package:originner/features/auth/controller/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneController = TextEditingController();
  Country? country;

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void pickCountry() {
    showCountryPicker(
        context: context,
        onSelect: (Country _country) {
          setState(() {
            country = _country;
          });
        });
  }

  void sendPhoneNumber() {
    String phoneNumber = phoneController.text.trim();
    if (country != null && phoneNumber.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .signInWithPhone(context, '+${country!.phoneCode}$phoneNumber');
    } else {
      showSnackBar(context: context, content: 'Fill out all the fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: lColor,
        title: const Text('Nhập số điện thoại của bạn'),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Mình cần xác minh số điện thoại của cậu.',
                style: TextStyle(
                  fontSize: 16,
                  // fontWeight: FontWeight.w100,
                  color: blackColor,
                ),
              ),
              const SizedBox(height: 20),
              // TextButton(
              //   onPressed: pickCountry,
              //   child: const Text('Chọn quê hương đi')
                
              // ),
              FittedBox(
              child: TextButton(
                onPressed: pickCountry,
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "Chọn quê hương đi",
                      style: TextStyle(
                        fontSize: 18,
                        // fontWeight: FontWeight.w300,
                        color: blackColor,
                      ),
                    ),
                    const Icon(
                      Iconsax.arrow_bottom,
                      color: lColor,
                    ),
                  ],
                ),
                // const
              ),
            ),
              const SizedBox(height: 5),
              if (country != null)
                Text(
                  '+${country!.phoneCode}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: lColor,
                  ),
                ),
              Row(
                children: [
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 50,
                    width: size.width * 0.85,
                    child: TextField(
                      controller: phoneController,
                      cursorColor: blackColor,
                      
                      decoration: const InputDecoration(
                        hintText: 'Số điện thoại',
                        hintStyle: TextStyle(
                          fontSize: 18,
                         
                          // fontWeight: FontWeight.w300,
                          color: greyColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.5),
              SizedBox(
                width: 200,
                child: CustomButton(
                  onPressed: sendPhoneNumber,
                  text: 'Tiếp tục',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
