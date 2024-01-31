import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:furniture_app/core/logic/helper_methods.dart';
import 'package:furniture_app/pages/product_screen/view.dart';
import '../core/design/cart_screen.dart';
import '../core/design/grid_items.dart';
import '../models/category_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List<String> categories = [
    "All",
    "Chairs",
    "Sofas",
    "Tables",
    "Beds",
  ];
  int activeIndex = 2;
  List<Map<String, dynamic>> navItems = [
    {
      "icon": Icons.location_city_rounded,
      "color": Colors.black54,
    },
    {
      "icon": Icons.compass_calibration,
      "color": Colors.black54,
    },
    {
      "icon": Icons.bookmark,
      "color": Colors.black54,
    },
    {
      "icon": Icons.mail,
      "color": Colors.black54,
    },
    {
      "icon": Icons.person,
      "color": Colors.black54,
    },
  ];

  Widget getCategories(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 2,
          bottom: 2,
          right: 20,
        ),
        width: 120,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedIndex == index ? Colors.indigo : Colors.transparent,
            width: 1.5,
          ),
          boxShadow: const [
            BoxShadow(
                color: Color(0xFFE7EEF8),
                blurRadius: 1,
                offset: Offset(2.6, 2.6)),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(35),
            bottomLeft: Radius.circular(35),
          ),
        ),
        child: Center(
          child: Text(
            categories[index],
            style: const TextStyle(
              fontSize: 19,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CircleNavBar(
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
        activeIndex: activeIndex,
        activeIcons: List.generate(
          navItems.length,
          (index) => Icon(
            navItems[index]["icon"],
            color: Colors.white,
          ),
        ),
        inactiveIcons: List.generate(
          navItems.length,
          (index) => Icon(
            navItems[index]["icon"],
            color: Colors.black54,
          ),
        ),
        height: 60,
        circleWidth: 60,
        color: Colors.white,
        circleColor: Colors.indigo,
      ),
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
                  onTap: () {},
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
                    child: const Icon(Icons.menu),
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
                              offset: Offset(
                                0.6,
                                0.7,
                              ),
                            ),
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
                                offset: Offset(0.6, 0.7)),
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
            Container(
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.only(
                left: 20,
                right: 15,
              ),
              height: 55,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFE7EEF8),
                    blurRadius: 1,
                    offset: Offset(2.6, 2.6),
                  ),
                ],
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(45),
                  bottomLeft: Radius.circular(45),
                ),
                border: Border.all(
                  color: Colors.indigo,
                  width: 1.5,
                ),
              ),
              child: Center(
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Search",
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    suffixIcon: Icon(
                      Icons.filter_alt_rounded,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 45,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: categories
                    .asMap()
                    .entries
                    .map(
                      (MapEntry map) => getCategories(
                        map.key,
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            StaggeredGrid.count(
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              crossAxisCount: 2,
              children: list.asMap().entries.map((MapEntry map) {
                int index = map.key;
                return GestureDetector(
                  onTap: () {
                    toGetNavigate(
                      ProductScreen(
                        model: list[index],
                      ),
                    );
                  },
                  child: GridItems(index),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
