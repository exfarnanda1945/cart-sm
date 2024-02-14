import 'package:cart_sm/model/product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddToCartDialog extends StatelessWidget {
  const AddToCartDialog({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
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
              product.title,
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
                    onPressed: () {},
                    icon: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xff2ed573),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: const Icon(
                          Icons.add,
                          size: 24,
                          color: Colors.white,
                        ))),
                const SizedBox(
                  width: 50,
                  child: TextField(
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xffff4757),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
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
            context.pop();
          },
          child: const Text('Ok'),
        ),
      ],
    );
    ;
  }
}
