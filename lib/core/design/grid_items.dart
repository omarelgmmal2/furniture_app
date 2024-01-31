import 'package:flutter/material.dart';
import 'package:furniture_app/core/design/app_image.dart';
import '../../models/category_model.dart';

class GridItems extends StatelessWidget {
  final int index;

  const GridItems(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFEAEEF9),
            blurRadius: 1,
            offset: Offset(4.5, 4.5),
          ),
        ],
        color: Colors.white,
        border: Border.all(
          color: Colors.indigo,
          width: 1.5,
        ),
        borderRadius: index == 0 || index % 3 == 0
            ? const BorderRadius.only(
                topRight: Radius.circular(100),
                bottomLeft: Radius.circular(100),
              )
            : const BorderRadius.only(
                topLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
      ),
      child: Column(
        children: [
          AppImage(
            "assets/images/${list[index].imageUrl}",
            width: 100,
            height: index % 3 == 0 ? 100 : 200,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            list[index].name,
            style: const TextStyle(
              color: Colors.indigo,
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            list[index].price,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
