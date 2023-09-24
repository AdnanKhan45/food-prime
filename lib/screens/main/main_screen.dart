

import 'package:flutter/material.dart';
import 'package:food_prime_app/screens/main/nav_pages/cart/cart_page.dart';
import 'package:food_prime_app/screens/main/nav_pages/home/home_page.dart';
import 'package:food_prime_app/theme/style.dart';

import 'nav_pages/profile/profile_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        currentIndex: _currentPageIndex,
        selectedItemColor: primaryColorED6E1B,
        selectedLabelStyle: const TextStyle(color: primaryColorED6E1B),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded), label: "Account"),
        ],
      ),
      body: _switchPagesOnIndex(_currentPageIndex)
    );
  }

  _switchPagesOnIndex(int index) {
    switch(index) {
      case 0: {
        return const HomePage();
      }
      case 1 : {
        return const CartPage();
      }
      case 2: {
        return const ProfilePage();
      }
    }
  }
}
