import 'package:cart_sm/model/product.dart';
import 'package:cart_sm/screen/cart/cart-provider.dart';
import 'package:cart_sm/screen/detail-product/add-to-cart-dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DetailProduct extends ConsumerWidget {
  const DetailProduct({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final countCart = ref.watch(cartProviderProvider);

    print(countCart);

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: const Color(0xff3867d6),
        title: const Text(
          "Detail Product",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Badge.count(
                count: countCart.length,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 32, left: 16.0, right: 16.0, bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.network(
                  product.image,
                  height: MediaQuery.of(context).size.height / 3,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                product.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.price}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Color(0xff3867d6),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color(0xffffc312),
                            size: 22,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            product.rate.toString(),
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "Category: ${product.category}",
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                product.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Ready in stock: ${product.count}",
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ))),
                child: const Text(
                  "Buy Directly",
                  style: TextStyle(color: Color(0xff3c64d4)),
                )),
            ElevatedButton(
                onPressed: () {
                  cartDialog(context);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xff3c64d4)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ))),
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(color: Colors.white),
                )),
            IconButton(
                onPressed: () {},
                icon: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xfffc427b), width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: const Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.favorite,
                        size: 32,
                        color: Color(0xfffc427b),
                      ),
                    ))),
          ],
        ),
      ),
    );
  }

  void cartDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AddToCartDialog(
            product: product,
          );
        });
  }
}
