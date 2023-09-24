

import 'package:flutter/material.dart';
import 'package:food_prime_app/screens/payment/payment_screen.dart';
import 'package:food_prime_app/theme/style.dart';

import '../../../../widgets/button_container_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Image.asset("assets/word_app_logo.png"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("2 items in the list cart", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
              itemBuilder: (context, index) {
                return _itemCartWidget(
                    title: "Pizza",
                    image: "pizza_popular_3.png",
                    price: "23.4"
                );
              })
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Items", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                Text("2", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              ],
            ),
            const SizedBox(height: 10,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery Fee", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                Text("\$0.00", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              ],
            ),
            const SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[350],
            ),
            const SizedBox(height: 10,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                Text("\$55.00", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              ],
            ),
            const SizedBox(height: 30,),
            ButtonContainerWidget(title: "Checkout", onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => PaymentScreen()));
            },),
            const SizedBox(height: 30,),
          ],
        ),
      )
    );
  }

  _itemCartWidget({String? title, String? price, String? image}) {
    return Container(
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 2),
                spreadRadius: 1.5,
                blurRadius: 6.5,
                color: Colors.grey[300]!
            )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
        child: Row(
          children: [
            Image.asset("assets/$image"),
            const SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("$title", style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: lightGreyColor,
                        ),
                        child: const Center(child: Icon(Icons.close, color: primaryColorED6E1B,),),
                      )
                    ],
                  ),
                  const Text("Times Food"),
                  const SizedBox(height:5,),
                   Text("\$$price", style: const TextStyle(fontWeight: FontWeight.w600),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1),
                        ),
                        child: const Center(child: Icon(Icons.remove_outlined),),
                      ),
                      const SizedBox(width: 10,),
                      const Text("1"),
                      const SizedBox(width: 10,),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1),
                        ),
                        child: const Center(child: Icon(Icons.add),),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
