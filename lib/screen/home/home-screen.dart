import 'package:cart_sm/model/product-repository.dart';
import 'package:cart_sm/model/product.dart';
import 'package:cart_sm/screen/cart/cart-provider.dart';
import 'package:cart_sm/screen/home/product-card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<Product>? products;

  @override
  void initState() {
    super.initState();
    ProductRepository().fetchProducts().then((value) {
      products = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      appBar: AppBar(
        key: scaffoldKey,
        backgroundColor: const Color(0xff3867d6),
        title: const Text(
          "Zstore",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Badge.count(
                count: ref.watch(cartProviderProvider).length,
                child: IconButton(
                  onPressed: () {
                    context.pushNamed("cart");
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: 30,
                  ),
                )),
          )
        ],
      ),
      body: products == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.count(
              primary: false,
              childAspectRatio: 5 / 7,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: products!
                  .map((product) => ProductCard(product: product))
                  .toList(),
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
