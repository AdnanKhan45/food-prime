
import 'package:flutter/material.dart';
import 'package:food_prime_app/screens/main/main_screen.dart';
import 'package:food_prime_app/theme/style.dart';

import '../../widgets/button_container_widget.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(child: Image.asset("assets/word_app_logo.png")),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "The best of your\nneighbourhood,\ndelivered for less.",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30,),
            _singlePremiumItemWidget(title: "Save an average of \$4 to 5 per order.", icon: const Icon(Icons.food_bank, color: primaryColorED6E1B, size: 30,),),
            const SizedBox(height: 20,),
            _singlePremiumItemWidget(title: "Look for FoodPrime logo to find\n1k eligible restaurants.", icon: const Icon(Icons.restaurant, color: primaryColorED6E1B, size: 30,)),
            const SizedBox(height: 20,),
            _singlePremiumItemWidget(title: "Enjoy zero delivery fees and reduced\nservice fees on order \$12.", icon: const Icon(Icons.shopping_cart, color: primaryColorED6E1B, size: 30,)),
            const SizedBox(height: 20,),
            _singlePremiumItemWidget(title: "Free 1 month trial, \$9.99 monthly\nafter, easily cancel anything.", icon: const Icon(Icons.calendar_today, color: primaryColorED6E1B, size: 30,)),
            const SizedBox(height: 30,),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
            const SizedBox(height: 30,),
            const ButtonContainerWidget(title: "Try FoodPrime free for 1 month"),
            const SizedBox(height: 30,),
            Center(
              child: GestureDetector(onTap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const MainScreen()), (route) => false);
              },child: const Text("Skip", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),)),
            ),
            const SizedBox(height: 30,),

            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                  text: "By tapping the button, I agree to the ", style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                        text: "Teams", style: TextStyle(color: primaryColorED6E1B)
                    ),
                    TextSpan(
                        text: "and an automatic monthly charge of \$9.99 until I ", style: TextStyle(color: Colors.black)
                    ),
                    TextSpan(
                        text: "cancel. ", style: TextStyle(color: primaryColorED6E1B)
                    ),
                    TextSpan(
                        text: "Cancel in account prior to any renewal to avoid charges.", style: TextStyle(color: Colors.black)
                    ),
                  ]
              ),
            )
          ],
        ),
      )
    );
  }

  _singlePremiumItemWidget({Widget? icon, String? title}) {
    return Row(
      children: [
        icon!,
        const SizedBox(width: 10,),
        Text("$title", style: const TextStyle(fontSize: 17),),
      ],
    );
  }
}
