import 'package:cart_sm/screen/cart/cart-card.dart';
import 'package:cart_sm/screen/cart/cart-provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.read(cartProviderProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3867d6),
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text(
          "Cart",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            return CartCard(
              cart: cart[index],
            );
          },
        ),
        // child: Column(
        //   children: [CartCard()],
        // ),
      ),
    );
  }
}
