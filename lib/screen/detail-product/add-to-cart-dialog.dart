import 'package:cart_sm/model/cart.dart';
import 'package:cart_sm/model/product.dart';
import 'package:cart_sm/screen/cart/cart-provider.dart';
import 'package:cart_sm/screen/detail-product/count-cart-provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class AddToCartDialog extends ConsumerWidget {
  const AddToCartDialog({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countCartProvider = ref.watch(countCartProviderProvider);
    final TextEditingController countController =
        TextEditingController(text: countCartProvider.toString());

    return AlertDialog(
      title: const Text(
        'Add to cart',
        style: TextStyle(fontSize: 18),
      ),
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 100,
        child: Column(
          children: [
            Text(
              "${product.title} - \$${product.price * countCartProvider}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      ref
                          .read(countCartProviderProvider.notifier)
                          .increment(product.count);
                    },
                    icon: Container(
                        decoration: BoxDecoration(
                            color: product.count <=
                                    ref.watch(countCartProviderProvider)
                                ? Colors.grey
                                : const Color(0xff2ed573),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: const Icon(
                          Icons.add,
                          size: 24,
                          color: Colors.white,
                        ))),
                SizedBox(
                  width: 50,
                  child: TextField(
                    maxLines: 1,
                    controller: countController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    enabled: false,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      ref.read(countCartProviderProvider.notifier).decrement();
                    },
                    icon: Container(
                        decoration: BoxDecoration(
                            color: ref.watch(countCartProviderProvider) > 1
                                ? const Color(0xffff4757)
                                : Colors.grey,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: const Icon(
                          Icons.remove,
                          size: 24,
                          color: Colors.white,
                        ))),
              ],
            )
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () {
            insertCart(context, ref);
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }

  void insertCart(BuildContext context, WidgetRef ref) {
    final countTotal = ref.watch(countCartProviderProvider);
    Cart cart = Cart(
        id: uuid.v4(),
        product: product,
        totalPrice: countTotal * product.price.toInt(),
        totalCount: countTotal);

    ref.read(cartProviderProvider.notifier).addToCart(cart);
    context.pop();
  }
}
