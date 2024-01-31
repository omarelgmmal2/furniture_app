import 'package:flutter/material.dart';
import 'package:furniture_app/core/design/app_image.dart';
import 'package:furniture_app/core/design/app_input.dart';
import 'package:furniture_app/core/design/app_input2.dart';
import '../../core/design/custom_container_facebook.dart';
import '../../core/design/custom_container_google.dart';
import '../../core/design/custom_container_log_in2.dart';
import '../../core/design/custom_container_sign_up2.dart';
import '../../core/design/custom_text_welcome.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          children:  const [
            AppImage(
              "assets/images/account.png",
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 5,
            ),
            CustomTextWelcome(text: "Create Your Account"),
            SizedBox(
              height: 10,
            ),
            AppInput2(
              labelText: "Full Name",
              isPerson: true,
              paddingBottom: 10,
            ),
            AppInput2(
              labelText: "Phone Number",
              paddingBottom: 10,
            ),
            AppInput(
              labelText: "Email",
              isEmail: true,
              paddingBottom: 10,
            ),
            AppInput(
              labelText: "Password",
              isPassword: true,
              paddingBottom: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomContainerLogin2(),
                CustomContainerSignUp2(),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomContainerGoogle(),
                SizedBox(
                  width: 40,
                ),
                CustomContainerFaceBook(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
