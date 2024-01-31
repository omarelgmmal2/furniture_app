import 'package:flutter/material.dart';
import 'package:furniture_app/auth/sign_up/sign_up_screen.dart';
import 'package:furniture_app/core/logic/helper_methods.dart';

class CustomContainerSignUp extends StatelessWidget {
  const CustomContainerSignUp({super.key,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toGetNavigate(const SignUpScreen(),);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        height: 60,
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(55),
            bottomRight: Radius.circular(55),
            bottomLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          border: Border.all(
            color: Colors.indigo,
            width: 1.5,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFE7EEF8),
              blurRadius: 1.0,
              offset: Offset(2.6, 2.6),
            ),
          ],
        ),
        child: const Center(
          child: Text(
            "Sign Up",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
