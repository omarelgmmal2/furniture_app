import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:furniture_app/core/design/app_image.dart';
import 'package:furniture_app/core/design/cart_screen.dart';
import 'package:furniture_app/models/category_model.dart';
import '../../core/logic/helper_methods.dart';

class ProductScreen extends StatefulWidget {
  final CategoryModel model;

  const ProductScreen({
    super.key,
    required this.model,
  });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List images = [], similarImages = [];
  List<int> colorList = [0xFF304B82, 0xFFBB4747, 0xFFF8C184, 0xFF5ABE65];
  int selectedColorIndex = 0,
      selectedSimilarColorIndex = 0,
      scrolledImageIndex = 0;

  int purchaseCount = 1;

  Widget getColor(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColorIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        height: 31,
        width: 31,
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedColorIndex == index
                ? Color(
                    colorList[index],
                  )
                : Colors.white,
            width: 1,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(31),
        ),
        child: Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
            color: Color(
              colorList[index],
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  Widget getSimilarColorImage(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSimilarColorIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        margin: const EdgeInsets.only(
          top: 2,
          bottom: 2,
          right: 20,
        ),
        width: 100,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFE7EEF8),
              offset: Offset(2.6, 2.6),
              blurRadius: 1,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selectedSimilarColorIndex == index
                ? Colors.indigo
                : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImage(
              "assets/images/${similarImages[index]}",
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    images = widget.model.differentImageUrl.keys.toList();
    similarImages = widget.model.differentImageUrl[images[scrolledImageIndex]]!;
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0xFFE7EEF8),
                            blurRadius: 4,
                            offset: Offset(0.6, 0.7)),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Icon(Icons.keyboard_backspace),
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        toGetNavigate(
                          const CartScreen(),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0xFFE7EEF8),
                                blurRadius: 4,
                                offset: Offset(0.6, 0.7)),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Icon(Icons.local_grocery_store),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFFE7EEF8),
                              blurRadius: 4,
                              offset: Offset(0.6, 0.7),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Icon(Icons.more_vert),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(
                  height: 28,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 12,
                      child: Stack(
                        children: [
                          Container(
                            height: 220,
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFFE7EEF8),
                                  blurRadius: 1,
                                  offset: Offset(
                                    4.6,
                                    4.6,
                                  ),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: PageView.builder(
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: AppImage(
                                    "assets/images/${images[index]}.png",
                                    height: 90,
                                    width: 90,
                                  ),
                                );
                              },
                              itemCount: images.length,
                              controller: PageController(
                                viewportFraction: 0.55,
                              ),
                              onPageChanged: (value) => setState(() {
                                selectedSimilarColorIndex = 0;
                                scrolledImageIndex = value;
                                purchaseCount = 0;
                              }),
                            ),
                          ),
                          Positioned.directional(
                            textDirection: TextDirection.ltr,
                            end: 15,
                            top: 15,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xFFE3EFFE),
                                      blurRadius: 4,
                                      offset: Offset(
                                        3.6,
                                        1.7,
                                      ),
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Icon(Icons.favorite_border),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 220,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFE7EEF8),
                              blurRadius: 1,
                              offset: Offset(
                                2.6,
                                2.6,
                              ),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(45),
                            bottomLeft: Radius.circular(45),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 25,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: colorList
                                .asMap()
                                .entries
                                .map((MapEntry map) => getColor(map.key))
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 28,
                ),
                SizedBox(
                  height: 70,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: similarImages
                        .asMap()
                        .entries
                        .map((MapEntry map) => getSimilarColorImage(map.key))
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 12,
                      child: Container(
                        height: 200,
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFE7EEF8),
                              blurRadius: 4,
                              offset: Offset(
                                4.6,
                                4.6,
                              ),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(90),
                            bottomLeft: Radius.circular(90),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.model.fullName,
                              style: const TextStyle(
                                color: Colors.indigo,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 30,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              onRatingUpdate: (value) {},
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              widget.model.price,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 200,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFE7EEF8),
                              blurRadius: 1,
                              offset: Offset(
                                2.6,
                                2.6,
                              ),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(65),
                            topLeft: Radius.circular(65),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: Column(
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
                                    size: 30,
                                    color: purchaseCount < 2
                                        ? Colors.grey
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Container(
                                height: 35,
                                width: 35,
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
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          widget.model.description,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 60,
                    width: MediaQuery.of(context).size.width / 1,
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
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Add To Cart",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
