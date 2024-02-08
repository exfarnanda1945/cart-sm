import 'package:cart_sm/model/product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed("detail",extra: product);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xff3867d6),
              width: 2,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            Image.network(
              product.image,
              fit: BoxFit.cover,
              height: 120,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              product.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              '\$${product.price}',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Color(0xff3867d6),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Color(0xffffc312),
                      size: 18,
                    ),
                    Text(product.rate.toString()),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.content_copy,
                      size: 14,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(product.count.toString())
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
