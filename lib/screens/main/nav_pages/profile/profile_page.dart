

import 'package:flutter/material.dart';
import 'package:food_prime_app/theme/style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        title: Image.asset("assets/word_app_logo.png"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings, color: Colors.black,)),
          const SizedBox(width: 10,),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset("assets/user_profile.png"),
                const SizedBox(width: 10,),
                const Text("John Smith", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
              ],
            ),
            const SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 20,),
            _settingsItem(
              title: "Language",
              prefixIcon: Icons.language
            ),
            const SizedBox(height: 15,),
            _settingsItem(
                title: "Help",
                prefixIcon: Icons.help
            ),
            const SizedBox(height: 15,),
            _settingsItem(
                title: "Theme",
                prefixIcon: Icons.light_mode_outlined
            ),
            const SizedBox(height: 15,),

          ],
        ),
      ),
    );
  }

  _settingsItem({String? title, IconData? prefixIcon}) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: lightGreyColor,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(prefixIcon, size: 30,),
              const SizedBox(width: 10,),
              Text("$title", style: const TextStyle(fontSize: 16),)
            ],
          ),
          const Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
