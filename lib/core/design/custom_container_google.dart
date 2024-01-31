import 'package:flutter/material.dart';

import 'app_image.dart';

class CustomContainerGoogle extends StatelessWidget {
  const CustomContainerGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFE7EEF8),
            blurRadius: 4.0,
            offset: Offset(0.6, 0.6),
          ),
        ],
      ),
      child: const AppImage(
        "assets/images/google_icon.png",
      ),
    );
  }
}
