
import 'package:flutter/material.dart';
import 'package:food_prime_app/theme/style.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onTap;
  const SearchWidget({Key? key, this.controller, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: lightGreyColor,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 3.0),
                color: Colors.grey[400]!,
                blurRadius: 5,
                spreadRadius: 1.5
            )
          ]
      ),
      child: TextFormField(
        onTap: onTap,
        controller: controller,
        decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            hintText: "Search your favorite"
        ),
      ),
    );
  }
}
