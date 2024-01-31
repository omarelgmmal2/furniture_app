import 'package:flutter/material.dart';
import 'package:furniture_app/core/design/app_image.dart';
import '../../models/category_model.dart';

class ListItems extends StatefulWidget {
  final int index;

  const ListItems(this.index, {super.key});

  @override
  State<ListItems> createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
  int purchaseCount = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.indigo,
            width: 1.5,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFE7EEF8),
              blurRadius: 1,
              offset: Offset(2.6, 2.6),
            ),
          ],
          color: Colors.white,
          borderRadius: widget.index == 0 || widget.index % 3 == 0
              ? const BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                )
              : const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AppImage(
                "assets/images/${list[widget.index].imageUrl}",
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                list[widget.index].name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                list[widget.index].price,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  if (purchaseCount > 1) {
                    purchaseCount -= 1;
                  } else {
                    purchaseCount = 1;
                  }
                  setState(() {});
                },
                child: SizedBox(
                  child: Icon(
                    Icons.remove,
                    size: 25,
                    color: purchaseCount < 2 ? Colors.grey : Colors.black,
                  ),
                ),
              ),
              Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Center(
                  child: Text(
                    purchaseCount.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    purchaseCount += 1;
                  });
                },
                child: const SizedBox(
                  child: Icon(
                    Icons.add,
                    size: 25,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
