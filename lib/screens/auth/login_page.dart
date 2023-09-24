
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_prime_app/screens/auth/sign_up_page.dart';
import 'package:food_prime_app/screens/premium/premium_screen.dart';
import 'package:food_prime_app/theme/style.dart';
import 'package:food_prime_app/widgets/form_container_widget.dart';

import '../../widgets/button_container_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _rememberMeCheckValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 140,),
                  const Text("Log In", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 20,),
                  const FormContainerWidget(hintText: "Email or Username"),
                  const SizedBox(height: 20,),
                  const FormContainerWidget(hintText: "Password"),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            onChanged: (value) {
                              setState(() {
                                _rememberMeCheckValue = value!;
                              });
                            },
                            value: _rememberMeCheckValue,
                          ),
                          const Text("Remember me", style: TextStyle(fontSize: 15),)
                        ],
                      ),
                      const Text("Forget Password", style: TextStyle(color: primaryColorED6E1B, fontSize: 15),)
                    ],
                  ),
                  const SizedBox(height: 20,),
                  ButtonContainerWidget(title: "Log In", onTap: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const PremiumScreen()), (route) => false);

                  },),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.black,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text("or"),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _optionSignIn(
                        color: redColor,
                        iconData: FontAwesomeIcons.google,
                      ),
                      _optionSignIn(
                        color: Colors.blue[900]!,
                        iconData: FontAwesomeIcons.facebook,
                      ),
                      _optionSignIn(
                        color: Colors.blue[600]!,
                        iconData: FontAwesomeIcons.linkedin,
                      ),
                    ],
                  ),

                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? ", style: TextStyle(fontSize: 15),),
                GestureDetector(onTap: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => SignUpPage()), (route) => false);
                },child: const Text("Create account", style: TextStyle(fontSize: 15, color: primaryColorED6E1B),))
              ],
            ),
          ],
        ),
      )
    );
  }

  Widget _optionSignIn({required IconData iconData, required Color color}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color
      ),
      child: Center(
        child: Icon(iconData, color: whiteColor,),
      ),
    );
  }
}
