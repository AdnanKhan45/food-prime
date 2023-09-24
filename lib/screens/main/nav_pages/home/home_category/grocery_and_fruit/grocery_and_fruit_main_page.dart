
import 'package:flutter/material.dart';
import 'package:food_prime_app/data/food_prime_data.dart';
import 'package:food_prime_app/screens/main/nav_pages/home/home_category/food/food_detail_page.dart';
import 'package:food_prime_app/screens/search/search_page.dart';
import 'package:food_prime_app/widgets/search_widget.dart';

import '../../../../../../theme/style.dart';

class GroceryAndFruitMainPage extends StatefulWidget {
  const GroceryAndFruitMainPage({super.key});

  @override
  State<GroceryAndFruitMainPage> createState() => _GroceryAndFruitMainPageState();
}

class _GroceryAndFruitMainPageState extends State<GroceryAndFruitMainPage> {

  int _currentSelectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: SearchWidget(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage()));
                    }
                  ),
                ),
                const SizedBox(width: 10,),
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: primaryColorED6E1B,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.settings_voice,
                      color: whiteColor,
                    ),
                  ),
                ),

              ],
            ),
            const SizedBox(height: 30,),
            const Text("Categories", style: TextStyle(fontSize: 16),),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _singleCategoryItemWidget(
                    title: "Fruits",
                    color: _currentSelectedCategory == 0
                        ? primaryColorED6E1B
                        : Colors.grey[400],
                    onTap: () {
                      setState(() {
                        _currentSelectedCategory = 0;
                      });
                    }),
                _singleCategoryItemWidget(
                    title: "Vegetables",
                    color: _currentSelectedCategory == 1
                        ? primaryColorED6E1B
                        : Colors.grey[400],
                    onTap: () {
                      setState(() {
                        _currentSelectedCategory = 1;
                      });
                    }),
                _singleCategoryItemWidget(
                    title: "Kitchen",
                    color: _currentSelectedCategory == 2
                        ? primaryColorED6E1B
                        : Colors.grey[400],
                    onTap: () {
                      setState(() {
                        _currentSelectedCategory = 2;
                      });
                    }),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            _switchCategoryOnSelectedIndex(_currentSelectedCategory)

          ],
        ),
      ),
    );
  }

  _singleCategoryItemWidget({VoidCallback? onTap, Color? color, String? title,}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: 110,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: color),
          child: Center(
            child: Text(
              "$title",
              style: const TextStyle(color: whiteColor),
            ),
          ),
        ),
      ),
    );
  }

  _switchCategoryOnSelectedIndex(int index) {
    switch (index) {
      case 0:
        {
          return _buildFruitsGridView();
        }
      case 1:
        {
          return _buildVegetablesGridView();
        }
      case 2:
        {
          return _buildKitchenGridView();
        }
    }
  }

  // FRUIT Grid View
  _buildFruitsGridView() {
    return Expanded(
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.8),
        children: FRUIT_CATEGORY_LIST.map((fruit) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetailPage(data: fruit)));

            },
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/${fruit['image']}",
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: Container(
                          width: 40,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: redColor),
                          child: Center(
                            child: Text(
                              "${fruit['price']}",
                              style: const TextStyle(color: whiteColor),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Text("${fruit['title']}")
              ],
            ),
          );
        }).toList(),
      )
    );
  }

  // VEGETABLES Grid View

  _buildVegetablesGridView() {
    return Expanded(
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.8),
          children: VEGETABLES_CATEGORY_LIST.map((vegetable) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetailPage(data: vegetable)));

              },
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      children: [
                        Image.asset(
                          "assets/${vegetable['image']}",
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 20,
                          right: 20,
                          child: Container(
                            width: 40,
                            height: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: redColor),
                            child: Center(
                              child: Text(
                                "${vegetable['price']}",
                                style: const TextStyle(color: whiteColor),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Text("${vegetable['title']}")
                ],
              ),
            );
          }).toList(),
        )
    );
  }

  // KITCHEN Grid View

  _buildKitchenGridView() {
    return Expanded(
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.8),
          children: KITCHEN_CATEGORY_LIST.map((kitchen) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetailPage(data: kitchen)));

              },
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      children: [
                        Image.asset(
                          "assets/${kitchen['image']}",
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 20,
                          right: 20,
                          child: Container(
                            width: 40,
                            height: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: redColor),
                            child: Center(
                              child: Text(
                                "${kitchen['price']}",
                                style: const TextStyle(color: whiteColor),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Text("${kitchen['title']}")
                ],
              ),
            );
          }).toList(),
        )
    );

  }
}
