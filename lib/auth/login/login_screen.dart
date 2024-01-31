import 'package:flutter/material.dart';
import 'package:furniture_app/core/design/app_image.dart';
import 'package:furniture_app/core/design/app_input.dart';
import '../../core/design/custom_container_facebook.dart';
import '../../core/design/custom_container_google.dart';
import '../../core/design/custom_container_log_in.dart';
import '../../core/design/custom_container_sign_up.dart';
import '../../core/design/custom_text_welcome.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          children: [
            const AppImage(
              "assets/images/shopping.png",
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomTextWelcome(text: "Welcome"),
            const SizedBox(
              height: 30,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  AppInput(
                    labelText: "Email",
                    isEmail: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "يجب ادخال بريدك الالكتروني";
                      } else if (value.length > 40) {
                        return "بريدك الالكتروني خطا";
                      }
                      return null;
                    },
                  ),
                  AppInput(
                    labelText: "Password",
                    isPassword: true,
                    paddingBottom: 25,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "كلمه المرور مطلوبه";
                      } else if (value.length < 8) {
                        return "كلمه المرور ضعيفه";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomContainerLogIn(),
                CustomContainerSignUp(),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Row(
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
