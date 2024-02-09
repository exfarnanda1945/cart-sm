import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3867d6),
        title: const Text(
          "Cart",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
