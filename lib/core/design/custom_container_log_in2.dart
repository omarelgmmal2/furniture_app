import 'package:flutter/material.dart';
import 'package:furniture_app/core/logic/helper_methods.dart';

import '../../pages/view.dart';

class CustomContainerLogin2 extends StatelessWidget {
  const CustomContainerLogin2({super.key,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toGetNavigate(const HomePage(),);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        height: 60,
        width: MediaQuery.of(context).size.width / 2,
        decoration: const BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(55),
            bottomRight: Radius.circular(55),
            bottomLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFE7EEF8),
              blurRadius: 1.0,
              offset: Offset(2.6, 2.6),
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Icon(
              Icons.login,
              color: Colors.white,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
