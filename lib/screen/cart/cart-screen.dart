import 'package:cart_sm/screen/cart/cart-card.dart';
import 'package:cart_sm/screen/cart/cart-provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countCart = ref.read(cartProviderProvider);
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
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [CartCard()],
        ),
      ),
    );
  }
}
