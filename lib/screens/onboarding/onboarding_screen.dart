

import 'package:flutter/material.dart';
import 'package:food_prime_app/screens/auth/login_page.dart';
import 'package:food_prime_app/screens/onboarding/onboarding_entity.dart';
import 'package:food_prime_app/theme/style.dart';
import 'package:food_prime_app/widgets/button_container_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  List<OnBoardingEntity> onBoardingData = OnBoardingEntity.onBoardingData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: onBoardingData.length,
          itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 80),
          child: Column(
            children: [
              Image.asset("assets/word_app_logo.png"),
              const SizedBox(
                height: 130,
              ),
              Image.asset("assets/${onBoardingData[index].image}"),
              const SizedBox(
                height: 40,
              ),
              Text(
                "${onBoardingData[index].title}",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "${onBoardingData[index].description}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: index == 0 ? primaryColorED6E1B : Colors.grey,
                        shape: BoxShape.circle),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: index == 1 ? primaryColorED6E1B : Colors.grey,
                        shape: BoxShape.circle),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: index == 2 ? primaryColorED6E1B : Colors.grey,
                        shape: BoxShape.circle),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              index == 2
                  ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: ButtonContainerWidget(
                  title: "Get Started",
                  hasIcon: true,
                  icon: Icons.arrow_forward_ios,
                  onTap: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false,);
                  },
                ),
              )
                  : Container(),
            ],
          ),
        );
      }),
    );
  }
}
